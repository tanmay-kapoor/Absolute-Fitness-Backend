const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const UnionStuff = require("../models/unionStuff");
const helpers = require("../util/helpers");

exports.authenticate = async (req, res) => {
    try {
        const username = req.body.username;
        const password = req.body.password;

        const [[entry]] = await UnionStuff.findUser(username);
        if (entry.length === 0) {
            res.status(404).json({ msg: "User does not exist" });
        } else {
            bcrypt.compare(password, entry[0].password, (err, found) => {
                if (!found) {
                    res.status(401).json({ msg: "Incorrect password" });
                } else {
                    // jwt stuff
                    const accessToken = helpers.generateAccessToken({
                        username,
                        type: entry[0].type,
                    });
                    const entryInfo = { ...entry[0] };
                    delete entryInfo["password"];
                    res.status(200).json({ ...entryInfo, accessToken });
                }
            });
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};
