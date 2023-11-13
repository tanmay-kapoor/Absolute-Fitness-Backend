import {
    getAllUsers,
    getUser,
    addUser,
    updateUser,
    deleteUser,
} from "../models/user";

import { genSaltSync, compare, hashSync } from "bcryptjs";
const salt = genSaltSync(10);

export async function getAllUsers(req, res) {
    try {
        const [[allUsers]] = await getAllUsers();
        allUsers.map((user) => delete user["password"]);
        res.status(200).json(allUsers);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getUser(req, res) {
    try {
        const email = req.params["email"];
        const [[user]] = await getUser(email);
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
}

export async function authenticate(req, res) {
    try {
        const username = req.body.username;
        const password = req.body.password;

        const [[user]] = await getUser(username);
        if (user.length == 0) {
            res.status(404).json({
                msg: `User does not exist`,
            });
        } else {
            compare(password, user[0].password, (err, found) => {
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
}

export async function addUser(req, res) {
    try {
        const details = {
            email: req.body.email,
            name: req.body.name,
            phone: req.body.phone,
            password: hashSync(req.body.password, salt),
            dob: req.body.dob,
            sex: req.body.sex,
            gymId: req.body.gymId,
        };
        const [[user]] = await getUser(details.email);
        if (user.length === 0) {
            await addUser(details);
            res.status(200).json({ msg: "Success" });
        } else {
            res.status(409).json({
                msg: "User with this email already exists",
            });
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function updateUser(req, res) {
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
            const [[user]] = await getUser(details.email);
            details.password = user[0].password;
        } else {
            details.password = hashSync(req.body.password, salt);
        }

        await updateUser(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function deleteUser(req, res) {
    try {
        const email = req.params["email"];
        await deleteUser(email);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}
