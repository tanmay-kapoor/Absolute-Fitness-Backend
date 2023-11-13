import {
    getAllHealthRecords,
    getAllHealthRecordsWithName,
    getHealthRecord,
    getHealthRecordsForUser,
    addHealthRecord,
    updateHealthRecord,
    deleteHealthRecord,
} from "../models/healthRecord";

export async function getAllHealthRecords(req, res) {
    try {
        const [[allHealthRecords]] = await getAllHealthRecords();
        res.status(200).json(allHealthRecords);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getAllHealthRecordsWithName(req, res) {
    try {
        const [[allHealthRecordsWithName]] =
            await getAllHealthRecordsWithName();
        res.status(200).json(allHealthRecordsWithName);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getHealthRecord(req, res) {
    try {
        const recordId = req.params["recordId"];
        const [[healthRecord]] = await getHealthRecord(recordId);
        if (healthRecord.length === 0) {
            res.status(401).json({ msg: "Does not exist" });
        } else {
            res.status(200).json(healthRecord[0]);
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getHealthRecordsForUser(req, res) {
    try {
        const email = req.params["email"];
        let [[healthRecords]] = await getHealthRecordsForUser(email);
        res.status(200).json(healthRecords);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function addHealthRecord(req, res) {
    try {
        const details = {
            height: req.body.height,
            weight: req.body.weight,
            dateCalculated: req.body.dateCalculated,
            email: req.body.email,
        };
        details.bmi =
            details.weight / ((details.height * details.height) / 10000);
        await addHealthRecord(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function updateHealthRecord(req, res) {
    try {
        const details = {
            recordId: req.params["recordId"],
            height: req.body.height,
            weight: req.body.weight,
            dateCalculated: req.body.dateCalculated,
            email: req.body.email,
        };
        details.bmi =
            details.weight / ((details.height * details.height) / 10000);
        await updateHealthRecord(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function deleteHealthRecord(req, res) {
    try {
        const recordId = req.params["recordId"];
        const [[healthRecord]] = await getHealthRecord(recordId);
        if (healthRecord.email !== req.user.username) {
            res.status(403).json({
                msg: "Incorrect authorization. Login with user you want to delete the record of.",
            });
        }
        await deleteHealthRecord(recordId);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}
