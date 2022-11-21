const HealthRecord = require("../models/healthRecord");

exports.getAllHealthRecords = async (req, res) => {
    try {
        const [allHealthRecords] = await HealthRecord.getAllHealthRecords();
        res.status(200).json(allHealthRecords);
    } catch (err) {
        res.status(500).json({ err: err.message });
    }
};

exports.getAllHealthRecordsWithName = async (req, res) => {
    try {
        const [allHealthRecordsWithName] =
            await HealthRecord.getAllHealthRecordsWithName();
        res.status(200).json(allHealthRecordsWithName);
    } catch (err) {
        res.status(500).json({ err: err.message });
    }
};

exports.getHealthRecord = async (req, res) => {
    try {
        const recordId = req.params["recordId"];
        const [healthRecord] = await HealthRecord.getHealthRecord(recordId);
        if (healthRecord.length === 0) {
            res.status(401).json({ msg: "Does not exist" });
        } else {
            res.status(200).json(healthRecord[0]);
        }
    } catch (err) {
        res.status(500).json({ err: err.message });
    }
};

exports.addHealthRecord = async (req, res) => {
    try {
        const details = {
            height: req.body.height,
            weight: req.body.weight,
            dateCalculated: req.body.dateCalculated,
            bmi: req.body.bmi,
            email: req.body.email,
        };
        await HealthRecord.addHealthRecord(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ err: err.message });
    }
};

exports.updateHealthRecord = async (req, res) => {
    try {
        const details = {
            recordId: req.params["recordId"],
            height: req.body.height,
            weight: req.body.weight,
            dateCalculated: req.body.dateCalculated,
            bmi: req.body.bmi,
            email: req.body.email,
        };
        await HealthRecord.updateHealthRecord(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ err: err.message });
    }
};

exports.deleteHealthRecord = async (req, res) => {
    try {
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ err: err.message });
    }
};
