const db = require("../util/database");

module.exports = class Trainer {
    static getTrainer(staffId) {
        return db.execute("CALL getTrainer(?)", [staffId]);
    }

    static addTrainer(details) {
        const {
            staffId,
            name,
            phone,
            dob,
            sex,
            partTime,
            salary,
            description,
            password,
            gymId,
            imageUrl,
            yearsOfExp,
            speciality,
        } = details;

        return db.execute("CALL addTrainer(?,?,?,?,?,?,?,?,?,?,?,?,?)", [
            staffId,
            name,
            phone,
            dob,
            sex,
            partTime,
            salary,
            description,
            password,
            gymId,
            imageUrl,
            yearsOfExp,
            speciality,
        ]);
    }

    static updateTrainer(details) {
        const {
            staffId,
            name,
            phone,
            dob,
            sex,
            partTime,
            salary,
            description,
            password,
            imageUrl,
            yearsOfExp,
            speciality,
        } = details;
        return db.execute("CALL updateTrainer(?,?,?,?,?,?,?,?,?,?,?,?)", [
            staffId,
            name,
            phone,
            dob,
            sex,
            partTime,
            salary,
            description,
            password,
            imageUrl,
            yearsOfExp,
            speciality,
        ]);
    }

    static getAllTrainersForGym(gymId) {
        const query = "CALL getAllTrainersForGym(?)";
        return db.execute(query, [gymId]);
    }

    static getAllUserHealthRecordsForTrainer(trainerId) {
        const query = "CALL getAllUserHealthRecordsForTrainer(?)";
        return db.execute(query, [trainerId]);
    }
};
