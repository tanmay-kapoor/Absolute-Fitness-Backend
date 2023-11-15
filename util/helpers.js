const jwt = require("jsonwebtoken");
const nodemailer = require("nodemailer");

exports.transporter = nodemailer.createTransport({
    port: 465,
    host: "smtp.gmail.com",
    auth: {
        user: process.env.SENDER_EMAIL,
        pass: process.env.SENDER_PASSWORD,
    },
    secure: true,
});

exports.generateAccessToken = (payload) => {
    return jwt.sign(payload, process.env.ACCESS_TOKEN_SECRET, {
        expiresIn: "7d",
    });
};
