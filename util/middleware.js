import { verify } from "jsonwebtoken";

export async function verifyAdminPriviledge(req, res, next) {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (user.type !== "admin")
            return res.status(403).json({
                msg: "Incorrect authorization. Need admin priviledge.",
            });
        req.user = user;
        next();
    });
}

export async function verifyToken(req, res, next) {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
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
}

export async function verifyLoggedIn(req, res, next) {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        req.user = user;
        next();
    });
}

export async function verifyMember(req, res, next) {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
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
}

export async function verifyMemberWithoutEmail(req, res, next) {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (user.type !== "member")
            return res.status(403).json({
                msg: "Incorrect authorization. Need member priviledge.",
            });
        req.user = user;
        next();
    });
}

export async function verifyEmployee(req, res, next) {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (!isValidEmployee(user))
            return res.status(403).json({
                msg: "Incorrect authorization. Needs to be admin or login with account that you are trying to update.",
            });
        req.user = user;
        next();
    });
}

export async function verifyEmployeeNotSpecific(req, res, next) {
    const authHeader =
        req.headers["Authorization"] || req.headers["authorization"];
    const token = authHeader && authHeader.split(" ")[1];
    if (token == null)
        return res.status(401).json({ msg: "No authorization provided." });

    verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if (err) return res.status(403).json({ msg: err.message });
        if (!isValidEmployeeNotSpecific(user))
            return res.status(403).json({
                msg: "Incorrect authorization. Needs to be an employee.",
            });
        req.user = user;
        next();
    });
}

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
