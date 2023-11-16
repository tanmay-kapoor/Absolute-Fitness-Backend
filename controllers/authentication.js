const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const UnionStuff = require("../models/unionStuff");
const helpers = require("../util/helpers");
const ResetToken = require("../models/resetToken");
const salt = bcrypt.genSaltSync(10);

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
                    });
                    const entryInfo = { ...entry[0] };
                    delete entryInfo["password"];
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

            // send email to user/admin with link to reset password
            const mailOptions = {
                from: process.env.SENDER_EMAIL,
                to: email,
                subject: "Reset password for Absolute Fitness account",
                html: `Dear client, 
                       <br /><br />
                       To reset your password, click 
                       <a href="${process.env.CLIENT_URL}/user/${email}/resetPassword/${token}">here</a>
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

exports.isValidResetToken = async (req, res) => {
    try {
        const details = { token: req.body.token, username: req.body.username };

        const isValidResetToken = await ResetToken.isValidResetToken(details);
        if (!isValidResetToken) {
            res.status(404).json({ msg: "Invalid token" });
        } else {
            res.status(200).json({ msg: "Valid token" });
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.resetPassword = async (req, res) => {
    try {
        const { username, token } = req.params;
        const password = req.body.password;
        const details = {
            username,
            token,
            password: bcrypt.hashSync(password, salt),
        };
        await UnionStuff.resetPassword(details);
        await ResetToken.deleteOldResetTokens(username);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};
