const Staff = require("../models/staff");
const bcrypt = require("bcryptjs");
const salt = bcrypt.genSaltSync(10);

exports.getAllStaff = async (req, res) => {
    try {
        const [allStaff] = await Staff.getAllStaff();
        allStaff.map((staff) => delete staff["password"]);
        res.status(200).json(allStaff);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getStaff = async (req, res) => {
    try {
        const staffId = req.params["staffId"];
        const [staff] = await Staff.getStaff(staffId);
        if (staff.length === 0) {
            res.status(401).json({ msg: "Staff does not exist" });
        } else {
            delete staff[0]["password"];
            res.json(staff[0]);
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.authenticate = async (req, res) => {
    try {
        const username = req.body.username;
        const password = req.body.password;

        let [staff] = await Staff.getStaff(username);
        if (staff.length == 0) {
            res.status(404).json({
                msg: `Staff does not exist`,
            });
        } else {
            bcrypt.compare(password, staff[0].password, (err, found) => {
                if (!found) {
                    res.status(401).json({ msg: "Incorrect password" });
                } else {
                    res.status(200).json({ msg: "Success" });
                    // jwt stuff
                }
            });
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.addStaff = async (req, res) => {
    try {
        const details = {
            staffId: req.body.staffId,
            name: req.body.name,
            phone: req.body.phone,
            partTime:
                req.body.partTime == "True" || req.body.partTime == "true"
                    ? true
                    : false,
            salary: req.body.salary,
            description: req.body.description,
            password: bcrypt.hashSync(req.body.password, salt),
            gymId: req.body.gymId,
        };
        await Staff.addStaff(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.updateStaff = async (req, res) => {
    try {
        const details = {
            staffId: req.params["staffId"],
            name: req.body.name,
            phone: req.body.phone,
            partTime:
                req.body.partTime === "True" || req.body.partTime === "true"
                    ? true
                    : false,
            salary: req.body.salary,
            description: req.body.description,
            password: bcrypt.hashSync(req.body.password, salt),
            gymId: req.body.gymId,
        };

        await Staff.updateStaff(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.deleteStaff = async (req, res) => {
    try {
        const staffId = req.params["staffId"];
        await Staff.deleteStaff(staffId);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};