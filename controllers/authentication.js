const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const UnionStuff = require("../models/unionStuff");
const helpers = require("../util/helpers");
const ResetToken = require("../models/resetToken");
const salt = bcrypt.genSaltSync(10);
const User = require("../models/user");
const {
    SENDER_EMAIL,
    CLIENT_URL,
    ACCESS_TOKEN_SECRET,
} = require("../util/constants");

exports.authenticate = async (req, res) => {
    try {
        const username = req.body.username;
        const password = req.body.password;

        const [[entry]] = await UnionStuff.findEntry(username);
        if (entry.length === 0) {
            res.status(404).json({ msg: "User does not exist" });
        } else {
            bcrypt.compare(password, entry[0].password, (err, found) => {
                if (!found) {
                    res.status(401).json({ msg: "Incorrect password" });
                } else {
                    // jwt stuff
                    const accessToken = helpers.generateAccessToken({
                        username,
                        type: entry[0].type,
                        gymId: entry[0].gym_id,
                    });
                    const entryInfo = { ...entry[0] };
                    delete entryInfo["password"];
                    delete entryInfo["type"];
                    res.status(200).json({ ...entryInfo, accessToken });
                }
            });
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.generateResetToken = async (req, res) => {
    try {
        const email = req.body.username;
        const [[entry]] = await UnionStuff.findEntry(email);
        if (entry.length === 0) {
            res.status(404).json({
                msg: "User does not exist",
            });
        } else {
            const token = await ResetToken.addResetToken({
                username: email,
                type: entry[0].type,
            });

            const [[[user]]] = await User.getUser(email);
            // send email to user/admin with link to reset password
            const mailOptions = {
                from: SENDER_EMAIL,
                to: email,
                subject: "Reset password for your Absolute Fitness account",
                html: `Dear ${user.name},
                       <br /><br />
                       To reset your password, click
                       <a href="${CLIENT_URL}/resetPassword/${token}">here</a>
                       <br /><br />
                       This is a one-time usable link and will expire in 30 minutes.
                       <br /><br />
                       Regards,<br />
                       Absolute Fitness Team.`,
            };

            helpers.transporter.sendMail(mailOptions, (err, info) => {
                if (err) throw err;

                res.status(200).json({
                    msg: "Check email for link to set new password",
                });
            });
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

const getUserFromToken = async (token) => {
    return new Promise((resolve, reject) => {
        jwt.verify(token, ACCESS_TOKEN_SECRET, async (err, user) => {
            if (err) {
                reject(err);
            }
            resolve(user);
        });
    });
};

exports.resetPassword = async (req, res) => {
    try {
        const { token } = req.params;

        const user = await getUserFromToken(token).catch((err) => {
            res.status(403).json({ msg: err.message });
        });

        const details = {
            ...user,
            password: bcrypt.hashSync(req.body.password, salt),
            token,
        };
        delete details["iat"];

        await UnionStuff.resetPassword(details);
        await ResetToken.deleteOldResetTokens(details.username);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};
