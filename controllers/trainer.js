const Trainer = require("../models/trainer");

exports.getAllUsersForTrainer = async (req, res) => {
    try {
        const trainerId = req.params["trainerId"];
        const [users] = await Trainer.getAllUsersForTrainer(trainerId);
        users.map((user) => {
            delete user["password"];
            delete user["trainer_id"];
        });
        res.status(200).json(users);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};
