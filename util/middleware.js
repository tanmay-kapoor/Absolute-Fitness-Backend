const jwt = require("jsonwebtoken");

exports.verifyAdminPriviledge = async (req, res, next) => {
    const authHeader = req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (user.type !== "admin")
            return res.status(403).json({
                msg: "Incorrect authorization. Need admin priviledge.",
            });
        req.user = user;
        next();
    });
};

exports.verifyToken = async (req, res, next) => {
    const authHeader = req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (
            user.type === "admin" ||
            (user.type === "member" && user.username === req.params["email"])
        ) {
            req.user = user;
            return next();
        }

        return res.status(403).json({
            msg: "Incorrect authorization. Should be admin or user you want details of.",
        });
    });
};
