const Trainer = require("../models/trainer");
const Staff = require("../models/staff");

exports.getTrainer = async (req, res) => {
    try {
        const staffId = req.params["staffId"];
        const [[trainer]] = await Trainer.getTrainer(staffId);
        if (trainer.length === 0) {
            res.status(401).json({ msg: "Trainer does not exist" });
        } else {
            res.json(trainer[0]);
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getAllUserHealthRecordsForTrainer = async (req, res) => {
    try {
        const trainerId = req.params["staffId"];
        const [[usersData]] = await Trainer.getAllUserHealthRecordsForTrainer(
            trainerId
        );

        let data = [];
        let healthRecords = [];
        if (usersData.length !== 0) {
            let email = usersData[0]["email"];
            for (let i = 0; i < usersData.length; i++) {
                if (usersData[i]["email"] === email) {
                    healthRecords = addStuffToHealthRecordArray(
                        usersData[i],
                        healthRecords
                    );
                } else {
                    data = addKeyOrPushToExisting(data, healthRecords, email);
                    healthRecords = addStuffToHealthRecordArray(
                        usersData[i],
                        []
                    );
                    email = usersData[i]["email"];
                }
            }

            if (healthRecords.length !== 0) {
                data = addKeyOrPushToExisting(data, healthRecords, email);
            }
        }
        res.status(200).json(data);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.addTrainer = async (req, res) => {
    try {
        const details = {
            staffId: req.body.staffId,
            name: req.body.name,
            phone: req.body.phone,
            dob: req.body.dob,
            sex: req.body.sex,
            partTime:
                req.body.partTime == 1 ||
                req.body.partTime === "True" ||
                req.body.partTime === "true" ||
                req.body.partTime === true
                    ? true
                    : false,
            salary: req.body.salary,
            description: req.body.description,
            password: "", // because no login flow for trainer
            gymId: req.body.gymId,
            imageUrl: req.body.image_url,
            yearsOfExp: req.body.yearsOfExp,
            speciality: req.body.speciality,
        };

        const [[trainer]] = await Trainer.getTrainer(details.staffId);
        if (trainer.length === 0) {
            await Trainer.addTrainer(details);
            const [[[newTrainer]]] = await Trainer.getTrainer(details.staffId);
            res.status(200).json(newTrainer);
        } else {
            res.status(409).json({
                msg: "This trainer id is already registered",
            });
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.updateTrainer = async (req, res) => {
    try {
        const details = {
            staffId: req.params["staffId"],
            name: req.body.name,
            phone: req.body.phone,
            dob: req.body.dob,
            sex: req.body.sex,
            partTime:
                req.body.partTime == 1 ||
                req.body.partTime === "True" ||
                req.body.partTime === "true" ||
                req.body.partTime === true
                    ? true
                    : false,
            salary: req.body.salary,
            description: req.body.description,
            password: "", // because no login flow for trainer
            imageUrl: req.body.imageUrl,
            yearsOfExp: req.body.yearsOfExp,
            speciality: req.body.speciality,
        };

        if (!req.body.password) {
            const [[staff]] = await Staff.getStaff(details.staffId);
            details.password = staff[0].password;
        } else {
            details.password = bcrypt.hashSync(req.body.password, salt);
        }
        await Trainer.updateTrainer(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

const addStuffToHealthRecordArray = (user, healthRecords) => {
    healthRecords.push({
        dateCalculated: user["date_calculated"],
        bmi: user["bmi"],
        height: user["height"],
        weight: user["weight"],
    });
    return healthRecords;
};
const addKeyOrPushToExisting = (data, healthRecords, email) => {
    let added = false;
    for (let j = 0; j < data.length; j++) {
        if (data[j]["user"] === email) {
            healthRecords.forEach((record) =>
                data[j]["healthRecords"].push(record)
            );
            added = true;
            break;
        }
    }
    if (!added) {
        data.push({
            user: email,
            healthRecords: healthRecords,
        });
    }
    return data;
};
