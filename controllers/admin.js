const Admin = require("../models/admin");
const Staff = require("../models/staff");
const ResetToken = require("../models/resetToken");
const helpers = require("../util/helpers");
const bcrypt = require("bcryptjs");
const salt = 10;
const { v4: uuidv4 } = require("uuid");
const { SENDER_EMAIL, CLIENT_URL } = require("../util/constants");

exports.getAllAdmins = async (req, res) => {
    try {
        const [[allAdmins]] = await Admin.getAllAdmins();
        allAdmins.map((admin) => delete admin["password"]);
        res.status(200).json(allAdmins);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getAdmin = async (req, res) => {
    try {
        const [[[admin]]] = await Admin.getAdmin(req.params.staffId);
        delete admin["password"];
        res.status(200).json(admin);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getAllAdminsForGym = async (req, res) => {
    try {
        const [[allAdmins]] = await Admin.getAllAdminsForGym(req.params.gymId);
        allAdmins.map((admin) => delete admin["password"]);
        res.status(200).json(allAdmins);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.addAdminForGym = async (req, res) => {
    try {
        const details = {
            staffId: req.body.staffId,
            name: req.body.name,
            phone: req.body.adminPhone,
            dob: req.body.dob,
            sex: req.body.sex,
            type: "admin",
            partTime:
                req.body.partTime == 1 ||
                req.body.partTime === "True" ||
                req.body.partTime === "true" ||
                req.body.partTime === true
                    ? true
                    : false,
            salary: req.body.salary,
            description: req.body.description,
            password: bcrypt.hashSync(uuidv4(), salt),
            gymId: req.body.gymId,
        };

        const [[admin]] = await Staff.getStaff(details.staffId);
        if (admin.length === 0) {
            await Staff.addStaff(details);

            const [[[newStaff]]] = await Staff.getStaff(details.staffId);
            delete newStaff["password"];

            await Admin.addAdminForGym({
                staffId: details.staffId,
                gymId: details.gymId,
            });

            // send email to admin email id
            const token = await ResetToken.addResetToken({
                username: details.staffId,
                type: details.type,
            });

            // send email to user/admin with link to reset password
            await helpers.sendMail({
                to: details.staffId,
                name: details.name,
                token: token,
            });

            res.status(200).json(newStaff);
        } else {
            res.status(409).json({
                msg: "This staff id is already registered",
            });
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};
