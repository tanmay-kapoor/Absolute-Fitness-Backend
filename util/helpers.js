const jwt = require("jsonwebtoken");
const nodemailer = require("nodemailer");
const {
    SENDER_EMAIL,
    SENDER_PASSWORD,
    ACCESS_TOKEN_SECRET,
} = require("./constants");

exports.transporter = nodemailer.createTransport({
    port: 465,
    host: "smtp.gmail.com",
    auth: {
        user: SENDER_EMAIL,
        pass: SENDER_PASSWORD,
    },
    secure: true,
});

exports.generateAccessToken = (payload) => {
    return jwt.sign(payload, ACCESS_TOKEN_SECRET, {
        expiresIn: "7d",
    });
};

exports.generateResetToken = (payload) => {
    return jwt.sign(payload, ACCESS_TOKEN_SECRET, {
        expiresIn: "30m",
    });
};
