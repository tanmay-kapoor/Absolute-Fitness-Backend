const jwt = require("jsonwebtoken");

exports.verifyAdminPriviledge = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
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

exports.verifyAdminPriviledgeOfSameGym = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (user.type !== "admin" || user.gymId !== req.body.gymId)
            return res.status(403).json({
                msg: "Incorrect authorization. Need admin priviledge of same gym.",
            });
        req.user = user;
        next();
    });
};

exports.verifyEmployeeOrAdminOfSameGym = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, async (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });

        const [[[staff]]] = await Staff.getGymId(req.params["staffId"]);
        if (!staff) {
            return res.status(401).json({ msg: "Staff does not exist" });
        } else if (
            (user.type === "admin" && user.gymId === gymId) ||
            (user.gymId === gymId &&
                user.type === "staff" &&
                user.username === req.params["staffId"])
        ) {
            req.user = user;
            return next();
        } else {
            return res.status(403).json({
                msg: "Incorrect authorization. Need admin priviledge of same gym or login with account that you are trying to update.",
            });
        }
    });
};

exports.verifyToken = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
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

exports.verifyLoggedIn = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        req.user = user;
        next();
    });
};

exports.verifyMember = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (
            user.type !== "member" ||
            (user.username !== req.params["email"] &&
                user.username !== req.body.email)
        )
            return res.status(403).json({
                msg: "Incorrect authorization. Need member priviledge.",
            });
        req.user = user;
        next();
    });
};

exports.verifyMemberWithoutEmail = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (user.type !== "member")
            return res.status(403).json({
                msg: "Incorrect authorization. Need member priviledge.",
            });
        req.user = user;
        next();
    });
};

exports.verifyEmployee = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (!isValidEmployee(user))
            return res.status(403).json({
                msg: "Incorrect authorization. Needs to be admin or login with account that you are trying to update.",
            });
        req.user = user;
        next();
    });
};

exports.verifyEmployeeNotSpecific = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (!isValidEmployeeNotSpecific(user))
            return res.status(403).json({
                msg: "Incorrect authorization. Needs to be an employee.",
            });
        req.user = user;
        next();
    });
};

const isValidEmployee = (user) => {
    if (user.type === "admin") return true;
    if (user.type === "staff" && user.username === req.params["staffId"])
        return true;
    if (user.type === "trainer" && user.username === req.params["trainerId"])
        return true;
    return false;
};

const isValidEmployeeNotSpecific = (user) => {
    if (
        user.type === "admin" ||
        user.type === "staff" ||
        user.type === "trainer"
    )
        return true;
    return false;
};
