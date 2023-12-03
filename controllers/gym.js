const Gym = require("../models/gym");
const Trainer = require("../models/trainer");
const Equipment = require("../models/equipment");
const Facility = require("../models/facility");
const User = require("../models/user");
const Admin = require("../models/admin");
const stockImage =
    "https://absolute-fitness-tk.s3.amazonaws.com/stock_image.jpeg";

exports.getAllGyms = async (req, res) => {
    try {
        const [[rows]] = await Gym.getAllGyms();
        const allGyms = formImageUrlsArray(rows);
        res.status(200).json(allGyms);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getGym = async (req, res) => {
    try {
        const gymId = req.params["gymId"];
        const [[rows]] = await Gym.getGym(gymId);
        if (rows.length === 0) {
            res.status(404).json({ msg: "Does not exist" });
        } else {
            const gym = formImageUrlsArray(rows)[0];
            res.json(gym);
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.addGym = async (req, res) => {
    try {
        const details = {
            branch: req.body.branch || null,
            pincode: req.body.pincode,
            phone: req.body.phone,
            location: req.body.location,
            membershipFee: req.body.membershipFee,
        };
        const [[result]] = await Gym.addGym(details);
        const [[[newGym]]] = await Gym.getGym(result.gym_id);
        delete newGym["image_url"];
        await Promise.all(
            req.body.image_urls.map((imageUrl) =>
                Gym.addImageUrlForGym(imageUrl, newGym.gym_id)
            )
        );
        newGym.image_urls =
            !req.body.image_urls || req.body.image_urls.length === 0
                ? [stockImage]
                : req.body.image_urls;
        res.status(200).json(newGym);
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

exports.addEquipment = async (req, res) => {
    try {
        const details = {
            name: req.body.name,
            imageUrl: req.body.image_url,
        };
        const [[[result]]] = await Equipment.addEquipment(details);
        const newEquipment = {
            equipmentId: result.equipment_id,
            name: details.name,
            image_url: details.imageUrl,
        };
        res.status(200).json(newEquipment);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.addEquipmentForGym = async (req, res) => {
    try {
        const details = {
            gymId: req.params["gymId"],
            equipmentId: req.body.equipmentId || null,
            name: req.body.name || null,
            imageUrl: req.body.image_url || null,
            quantity: req.body.quantity,
            lastServiced: req.body.lastServiced || null,
        };

        const [[[result]]] = await Equipment.addEquipmentForGym(details);
        res.status(200).json(result);
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

exports.getAllEquipmentsForGym = async (req, res) => {
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
        allStaff.map((staff) => {
            delete staff["password"];
            delete staff["gym_id"];
        });
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
            lastServiced: req.body.last_serviced || null,
        };
        await Equipment.updateEquipmentForGym(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.deleteEquipmentForGym = async (req, res) => {
    try {
        const details = {
            gymId: req.params["gymId"],
            equipmentId: req.params["equipmentId"],
        };
        await Equipment.deleteEquipmentForGym(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

const formImageUrlsArray = (rows) => {
    const gyms = {};

    rows.forEach((row) => {
        const { gym_id, ...data } = row;
        delete data["image_url"];
        if (!gyms[gym_id]) {
            gyms[gym_id] = { gym_id, ...data, image_urls: [stockImage] };
        }
        if (row.image_url !== null) {
            if (gyms[gym_id].image_urls === stockImage)
                gyms[gym_id].image_urls = [];
            gyms[gym_id].image_urls.push(row.image_url);
        }
    });

    return Object.values(gyms);
};
