import {
    getAllStaff,
    getStaff,
    addStaff,
    updateStaff,
    deleteStaff,
} from "../models/staff";
import { getAdmin } from "../models/admin";

import { sign } from "jsonwebtoken";
import { genSaltSync, compare, hashSync } from "bcryptjs";
import { getTrainer } from "../models/trainer";
const salt = genSaltSync(10);

export async function getAllStaff(req, res) {
    try {
        let [[allStaff]] = await getAllStaff();
        allStaff = await attachStaffType(allStaff);
        res.status(200).json(allStaff);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getStaff(req, res) {
    try {
        const staffId = req.params["staffId"];
        const [[staff]] = await getStaff(staffId);
        if (staff.length === 0) {
            res.status(401).json({ msg: "Staff does not exist" });
        } else {
            const detailsToSend = staff[0];
            delete detailsToSend["password"];
            detailsToSend["type"] = await getStaffType(
                detailsToSend["staff_id"]
            );
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

        const [[staff]] = await getStaff(username);
        if (staff.length == 0) {
            res.status(404).json({
                msg: `Staff does not exist`,
            });
        } else {
            compare(password, staff[0].password, async (err, found) => {
                if (!found) {
                    res.status(401).json({ msg: "Incorrect password" });
                } else {
                    // jwt stuff
                    const user = {
                        username,
                        type: await getStaffType(staff[0]["staff_id"]),
                    };
                    const accessToken = sign(
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

export async function addStaff(req, res) {
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
            password: hashSync(req.body.password, salt),
            gymId: req.body.gymId,
        };
        const [[staff]] = await getStaff(details.staffId);
        if (staff.length === 0) {
            await addStaff(details);
            res.status(200).json({ msg: "Success" });
        } else {
            res.status(409).json({
                msg: "This staff id is already registered",
            });
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function updateStaff(req, res) {
    try {
        const details = {
            staffId: req.params["staffId"],
            name: req.body.name,
            phone: req.body.phone,
            partTime: req.body.partTime == 1 ? true : false,
            salary: req.body.salary,
            description: req.body.description,
        };

        if (!req.body.password) {
            const [[staff]] = await getStaff(details.staffId);
            details.password = staff[0].password;
        } else {
            details.password = hashSync(req.body.password, salt);
        }
        await updateStaff(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function deleteStaff(req, res) {
    try {
        const staffId = req.params["staffId"];
        await deleteStaff(staffId);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

const attachStaffType = (allStaff) => {
    const promises = allStaff.map(async (staff) => {
        delete staff["password"];
        staff["type"] = await getStaffType(staff["staff_id"]);
        return staff;
    });
    return Promise.all(promises);
};

const getStaffType = async (staffId) => {
    let [[details]] = await getTrainer(staffId);

    if (details.length != 0) {
        return "trainer";
    } else {
        [[details]] = await getAdmin(staffId);
        if (details.length != 0) {
            return "admin";
        }
        return "staff";
    }
};
