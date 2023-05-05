const Gym = require("../models/gym");
const Trainer = require("../models/trainer");
const Equipment = require("../models/equipment");
const Facility = require("../models/facility");
const User = require("../models/user");
const Admin = require("../models/admin");
const { all } = require("../routes/user");

exports.getAllGyms = async (req, res) => {
    try {
        const [[allGyms]] = await Gym.getAllGyms();
        res.status(200).json(allGyms);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getGym = async (req, res) => {
    try {
        const gymId = req.params["gymId"];
        const [[gym]] = await Gym.getGym(gymId);

        if (gym.length === 0) {
            res.status(401).json({ msg: "Does not exist" });
        } else {
            res.json(gym[0]);
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.addGym = async (req, res) => {
    try {
        const details = {
            imageUrl: req.body.imageUrl,
            phone: req.body.phone,
            location: req.body.location,
            membershipFee: req.body.membershipFee,
        };
        await Gym.addGym(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.updateGym = async (req, res) => {
    try {
        const details = {
            gymId: req.params["gymId"],
            imageUrl: req.body.imageUrl,
            phone: req.body.phone,
            location: req.body.location,
            membershipFee: req.body.membershipFee,
        };
        await Gym.updateGym(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.deleteGym = async (req, res) => {
    try {
        const gymId = req.params["gymId"];
        await Gym.deleteGym(gymId);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getAllFacilities = async (req, res) => {
    try {
        const gymId = req.params["gymId"];
        const [[allFacilities]] = await Facility.getAllFacilitiesForGym(gymId);
        res.status(200).json(allFacilities);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getAllEquipments = async (req, res) => {
    try {
        const gymId = req.params["gymId"];
        const [[allEquipments]] = await Equipment.getAllEquipmentsForGym(gymId);
        res.status(200).json(allEquipments);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getAllTrainers = async (req, res) => {
    try {
        const gymId = req.params["gymId"];
        const [[allTrainers]] = await Trainer.getAllTrainersForGym(gymId);
        allTrainers.map((trainer) => delete trainer["password"]);
        res.status(200).json(allTrainers);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getAllUsers = async (req, res) => {
    try {
        const gymId = req.params["gymId"];
        const [[allUsers]] = await User.getAllUsersForGym(gymId);
        allUsers.map((user) => {
            delete user["password"];
            delete user["gym_id"];
        });
        res.status(200).json(allUsers);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getAllStaff = async (req, res) => {
    try {
        const gymId = req.params["gymId"];
        let [[allStaff]] = await User.getAllStaffForGym(gymId);
        allStaff = await attachStaffType(allStaff);
        res.status(200).json(allStaff);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.updateEquipmentForGym = async (req, res) => {
    try {
        const details = {
            gymId: req.params["gymId"],
            equipmentId: req.params["equipmentId"],
            quantity: req.body.quantity,
            lastServiced: req.body.last_serviced,
        };
        await Equipment.updateEquipmentForGym(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

const attachStaffType = (allStaff) => {
    const promises = allStaff.map(async (staff) => {
        delete staff["password"];
        delete staff["gym_id"];
        staff["type"] = await getStaffType(staff["staff_id"]);
        return staff;
    });
    return Promise.all(promises);
};

const getStaffType = async (staffId) => {
    let [[details]] = await Trainer.getTrainer(staffId);

    if (details.length != 0) {
        return "trainer";
    } else {
        [[details]] = await Admin.getAdmin(staffId);
        if (details.length != 0) {
            return "admin";
        }
        return "staff";
    }
};
