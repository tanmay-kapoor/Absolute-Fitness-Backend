const User = require("../models/user");
const bcrypt = require("bcryptjs");
const salt = bcrypt.genSaltSync(10);

exports.getAllUsers = async (req, res) => {
    try {
        const [allUsers] = await User.getAllUsers();
        res.status(200).json(allUsers);
    } catch (err) {
        res.status(500).json({ err: err.message });
    }
};

exports.getUser = async (req, res) => {
    const email = req.params["email"];
    try {
        const [user] = await User.getUser(email);
        if (user.length === 0) {
            res.status(401).json({ msg: "User does not exist" });
        } else {
            res.json(user[0]);
        }
    } catch (err) {
        res.status(500).json({ err: err.message });
    }
};

exports.authenticate = async (req, res) => {
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
        res.status(500).json({ err: err.message });
    }
};

exports.addUser = async (req, res) => {
    const details = {
        email: req.body.email,
        name: req.body.name,
        password: bcrypt.hashSync(req.body.password, salt),
        age: req.body.age,
        sex: req.body.sex,
        gymId: req.body.gymId,
    };

    try {
        await User.addUser(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ err: err.message });
    }
};

exports.updateUser = async (req, res) => {
    const details = {
        email: req.params["email"],
        name: req.body.name,
        password: bcrypt.hashSync(req.body.password, salt),
        age: req.body.age,
        sex: req.body.sex,
        gymId: req.body.gymId,
    };

    try {
        await User.updateUser(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ err: err.message });
    }
};

exports.deleteUser = async (req, res) => {
    const email = req.params.email;

    try {
        await User.deleteUser(email);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ err: err.message });
    }
};
