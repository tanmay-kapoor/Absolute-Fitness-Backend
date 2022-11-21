const User = require("../models/user");
const bcrypt = require("bcryptjs");
const salt = bcrypt.genSaltSync(10);

const getAllUsers = async (req, res) => {
    try {
        const [allUsers] = await User.getAllUsers();
        res.status(200).json(allUsers);
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

const getUser = async (req, res) => {
    const email = req.params["email"];
    try {
        const [user] = await User.getUser(email);
        if (user.length == 0) {
            res.status(401).json({ msg: "User does not exist" });
        } else {
            res.json(user[0]);
        }
    } catch (err) {
        res.status(500).json({
            error: `Something went wrong`,
        });
    }
};

const authenticate = async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;

    try {
        let [user] = await User.getUser(email);
        if (user.length == 0) {
            res.status(404).json({
                error: `User with email ${email} does not exist`,
            });
        } else {
            user = user[0];

            bcrypt.compare(password, user.password, (err, found) => {
                if (!found) {
                    res.status(401).json({ msg: "Incorrect password" });
                } else {
                    res.status(200).json({ msg: "Success" });
                    // jwt stuff
                }
            });
        }
    } catch (err) {
        res.status(500).json({ err: "Something went wrong" });
    }
};

const addUser = async (req, res) => {
    const email = req.body.email;
    const name = req.body.name;
    const password = bcrypt.hashSync(req.body.password, salt);

    try {
        await User.addUser(email, name, password);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(404).json({
            err: `email ${email} already exists in db`,
        });
    }
};

const updateUser = async (req, res) => {
    const email = req.params.email;
    const name = req.body.name;
    const password = bcrypt.hashSync(req.body.password, salt);

    try {
        await User.updateUser(email, name, password);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({
            error: "Unable to process",
        });
    }
};

const deleteUser = async (req, res) => {
    const email = req.params.email;

    try {
        await User.deleteUser(email);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(404).json({
            error: `U`,
        });
    }
};

module.exports = {
    getAllUsers,
    getUser,
    authenticate,
    addUser,
    updateUser,
    deleteUser,
};
