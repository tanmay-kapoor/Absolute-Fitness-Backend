const jwt = require("jsonwebtoken");
const { ACCESS_TOKEN_SECRET } = require("../constants");
const Staff = require("../../models/staff");

exports.verifyRootPriviledge = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];

    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (user.type !== "root")
            return res.status(403).json({
                msg: "Incorrect authorization. Need root priviledge.",
            });
        req.user = user;
        next();
    });
};

exports.validateConsistentUsernameInTokens = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const accessToken = authHeader && authHeader.split(" ")[1];
    const paymentToken = req.body.paymentToken;

    if (accessToken == null)
        return res.status(401).json({ msg: "No authorization provided." });
    if (paymentToken == null)
        return res.status(422).json({ msg: "No payment token provided." });

    jwt.verify(accessToken, ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        jwt.verify(paymentToken, ACCESS_TOKEN_SECRET, (error, paymentUser) => {
            if (error) return res.status(403).json({ msg: error.message });
            if (user.username !== paymentUser.username)
                return res.status(403).json({
                    msg: "Incorrect authorization. Need to be same user.",
                });
            req.user = user;
            next();
        });
    });
};

exports.verifyRootOrAdminPriviledge = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];

    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (user.type !== "root" && user.type !== "admin")
            return res.status(403).json({
                msg: "Incorrect authorization. Need root priviledge or admin priviledge.",
            });
        req.user = user;
        next();
    });
};

exports.verifyRootOrAdminPriviledgeOfSameGym = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, ACCESS_TOKEN_SECRET, async (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (
            user.type === "root" ||
            (user.type === "admin" &&
                (user.gymId === req.params.gymId ||
                    user.gymId === req.body.gymId))
        ) {
            req.user = user;
            return next();
        } else {
            return res.status(403).json({
                msg: "Incorrect authorization. Need root priviledge or admin priviledge of same gym.",
            });
        }
    });
};

exports.verifyAdminPriviledge = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, ACCESS_TOKEN_SECRET, (err, user) => {
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

    jwt.verify(token, ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (
            user.type !== "admin" &&
            user.gymId !== req.body.gymId &&
            user.gymId !== parseInt(req.params["gymId"])
        )
            return res.status(403).json({
                msg: "Incorrect authorization. Need admin priviledge of same gym.",
            });
        req.user = user;
        next();
    });
};

exports.verifyRootOrEmployeeOrAdminOfSameGym = async (req, res, next) => {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    jwt.verify(token, ACCESS_TOKEN_SECRET, async (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });

        const [[[staff]]] = await Staff.getStaff(req.params["staffId"]);
        if (!staff) {
            return res.status(401).json({ msg: "Staff does not exist" });
        } else if (
            user.type === "root" ||
            (user.type === "admin" && user.gymId === staff.gymId) ||
            (user.gymId === staff.gymId &&
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

    jwt.verify(token, ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (
            user.type === "root" ||
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

    jwt.verify(token, ACCESS_TOKEN_SECRET, (err, user) => {
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

    jwt.verify(token, ACCESS_TOKEN_SECRET, (err, user) => {
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

    jwt.verify(token, ACCESS_TOKEN_SECRET, (err, user) => {
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

    jwt.verify(token, ACCESS_TOKEN_SECRET, (err, user) => {
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

    jwt.verify(token, ACCESS_TOKEN_SECRET, (err, user) => {
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
