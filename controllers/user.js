const User = require("../models/user");
const ResetToken = require("../models/resetToken");
const transporter = require("../util/email");
const jwt = require("jsonwebtoken");

const bcrypt = require("bcryptjs");
const salt = bcrypt.genSaltSync(10);

exports.getAllUsers = async (req, res) => {
    try {
        const [[allUsers]] = await User.getAllUsers();
        allUsers.map((user) => delete user["password"]);
        res.status(200).json(allUsers);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getUser = async (req, res) => {
    try {
        const email = req.params["email"];
        const [[user]] = await User.getUser(email);
        if (user.length === 0) {
            res.status(401).json({ msg: "User does not exist" });
        } else {
            const detailsToSend = user[0];
            delete detailsToSend["password"];
            detailsToSend["type"] = "member";
            res.json(detailsToSend);
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.authenticate = async (req, res) => {
    try {
        const username = req.body.username;
        const password = req.body.password;

        const [[user]] = await User.getUser(username);
        if (user.length == 0) {
            res.status(404).json({
                msg: `User does not exist`,
            });
        } else {
            bcrypt.compare(password, user[0].password, (err, found) => {
                if (!found) {
                    res.status(401).json({ msg: "Incorrect password" });
                } else {
                    // jwt stuff
                    const user = { username, type: "member" };
                    const accessToken = jwt.sign(
                        user,
                        process.env.ACCESS_TOKEN_SECRET,
                        { expiresIn: "7d" }
                    );
                    res.status(200).json({ accessToken });
                }
            });
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.addUser = async (req, res) => {
    try {
        const details = {
            email: req.body.email,
            name: req.body.name,
            phone: req.body.phone,
            password: bcrypt.hashSync(req.body.password, salt),
            dob: req.body.dob,
            sex: req.body.sex,
            gymId: req.body.gymId,
        };
        const [[user]] = await User.getUser(details.email);
        if (user.length === 0) {
            await User.addUser(details);
            res.status(200).json({ msg: "Success" });
        } else {
            res.status(409).json({
                msg: "User with this email already exists",
            });
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.generateResetToken = async (req, res) => {
    try {
        const email = req.body.email;
        const [[user]] = await User.getUser(email);
        if (user.length === 0) {
            res.status(404).json({
                msg: "User does not exist",
            });
        } else {
            const token = await ResetToken.addResetToken(email);

            // send email to user with link to reset password
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

            transporter.sendMail(mailOptions, (err, info) => {
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

exports.resetPassword = async (req, res) => {
    try {
        const { email, token } = req.params;
        const password = req.body.password;
        const details = {
            email,
            token,
            password: bcrypt.hashSync(password, salt),
        };
        await User.resetPassword(details);
        await ResetToken.deleteOldResetTokens(email);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.updateUser = async (req, res) => {
    try {
        const details = {
            email: req.params["email"],
            name: req.body.name,
            phone: req.body.phone,
            dob: req.body.dob.substring(0, 10),
            sex: req.body.sex,
            gymId: req.body.gymId,
        };
        if (!req.body.password) {
            const [[user]] = await User.getUser(details.email);
            details.password = user[0].password;
        } else {
            details.password = bcrypt.hashSync(req.body.password, salt);
        }

        await User.updateUser(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.deleteUser = async (req, res) => {
    try {
        const email = req.params["email"];
        await User.deleteUser(email);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};
exports.isValidResetToken = async (req, res) => {
    try {
        const details = { token: req.body.token, email: req.body.email };

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
