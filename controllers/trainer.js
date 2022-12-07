const Trainer = require("../models/trainer");

exports.getAllUserHealthRecordsForTrainer = async (req, res) => {
    try {
        const trainerId = req.params["staffId"];
        const [users] = await Trainer.getAllUserHealthRecordsForTrainer(
            trainerId
        );
        users.map((user) => {
            delete user["trainer_id"];
            delete user["email"];
        });
        res.status(200).json(users);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};
