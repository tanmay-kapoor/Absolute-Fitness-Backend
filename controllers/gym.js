const Gym = require("../models/gym");

exports.getAllGyms = async (req, res) => {
    try {
        const [allGyms] = await Gym.getAllGyms();
        res.status(200).json(allGyms);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getGym = async (req, res) => {
    try {
        const gymId = req.params["gymId"];

        const [gym] = await Gym.getGym(gymId);
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
