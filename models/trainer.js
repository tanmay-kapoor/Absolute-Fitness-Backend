const db = require("../util/database");

module.exports = class Trainer {
    static getTrainer(staffId) {
        return db.execute("CALL getTrainer(?)", [staffId]);
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
