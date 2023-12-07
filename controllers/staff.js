const Staff = require("../models/staff");
const Admin = require("../models/admin");
const helpers = require("../util/helpers");
const bcrypt = require("bcryptjs");
const Trainer = require("../models/trainer");
const salt = bcrypt.genSaltSync(10);

exports.getAllStaff = async (req, res) => {
    try {
        let [[allStaff]] = await Staff.getAllStaff();
        allStaff.map((staff) => delete staff["password"]);
        res.status(200).json(allStaff);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getStaff = async (req, res) => {
    try {
        const staffId = req.params["staffId"];
        const [[staff]] = await Staff.getStaff(staffId);
        if (staff.length === 0) {
            res.status(401).json({ msg: "Staff does not exist" });
        } else {
            const detailsToSend = staff[0];
            delete detailsToSend["password"];
            res.json(detailsToSend);
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.addStaff = async (req, res) => {
    try {
        const details = {
            staffId: req.body.staff_id,
            name: req.body.name,
            phone: req.body.phone,
            dob: req.body.dob,
            sex: req.body.sex,
            type: req.body.type || req.user.type,
            partTime: false,
            salary: req.body.salary,
            description: req.body.description,
            password: bcrypt.hashSync(req.body.password || "random", salt),
            gymId: req.body.gym_id,
        };
        const [[staff]] = await Staff.getStaff(details.staffId);
        if (staff.length === 0) {
            await Staff.addStaff(details);
            const [[[newStaff]]] = await Staff.getStaff(details.staffId);
            const accessToken = helpers.generateAccessToken({
                username: details.staffId,
                type: details.type,
                gymId: details.gymId,
            });
            res.status(200).json({ ...newStaff, accessToken });
        } else {
            res.status(409).json({
                msg: "This staff id is already registered",
            });
        }
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
            dob: req.body.dob,
            sex: req.body.sex,
            type: req.body.type || req.user.type,
            partTime: false,
            salary: req.body.salary,
            description: req.body.description,
        };

        if (req.user.username === details.staffId) {
            details.type = req.body.type || req.user.type;
        } else {
            details.type =
                req.body.type || (await getStaffLocal(details.staffId)).type;
        }

        details.password = req.body.password
            ? bcrypt.hashSync(req.body.password, salt)
            : (await getStaffLocal(details.staffId)).password;

        details.partTime = req.body.partTime
            ? getPartTimeValue(req.body.partTime)
            : (await getStaffLocal(details.staffId)).part_time;

        details.salary = req.body.salary
            ? req.body.salary
            : (await getStaffLocal(details.staffId)).salary;

        details.description = req.body.description
            ? req.body.description
            : (await getStaffLocal(details.staffId)).description;

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

let staffMember;
const getStaffLocal = async (staffId) => {
    if (!staffMember) {
        [[[staffMember]]] = await Staff.getStaff(staffId);
    }
    return staffMember;
};

const getPartTimeValue = (partTime) => {
    // return (
    //     partTime == 1 ||
    //     partTime === "True" ||
    //     partTime === "true" ||
    //     partTime === true
    // );
    return false;
};
