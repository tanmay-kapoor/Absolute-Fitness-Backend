const jwt = require("jsonwebtoken");
const nodemailer = require("nodemailer");
const {
    SENDER_EMAIL,
    SENDER_PASSWORD,
    ACCESS_TOKEN_SECRET,
    CLIENT_URL,
} = require("./constants");

const transporter = nodemailer.createTransport({
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

exports.generatePaymentSuccessToken = (payload) => {
    return jwt.sign(payload, ACCESS_TOKEN_SECRET, {
        expiresIn: "10m",
    });
};

exports.generateResetToken = (payload) => {
    return jwt.sign(payload, ACCESS_TOKEN_SECRET, {
        expiresIn: "30m",
    });
};

exports.sendMail = async ({ to, name, token }) => {
    const mailOptions = {
        from: SENDER_EMAIL,
        to,
        subject: "Reset password for your Absolute Fitness account",
        html: `Dear ${name},
               <br /><br />
               To reset your password, click
               <a href="${CLIENT_URL}/resetPassword/${token}">here</a>
               <br /><br />
               This is a one-time usable link and will expire in 30 minutes.
               <br /><br />
               Regards,<br />
               Absolute Fitness Team.`,
    };

    await transporter.sendMail(mailOptions);
};
