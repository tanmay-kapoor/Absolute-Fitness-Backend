const db = require("../util/database");

module.exports = class HealthRecord {
    static getAllHealthRecords() {
        return db.execute("CALL getAllHealthRecords()");
    }

    static getAllHealthRecordsWithName() {
        const query = "CALL getAllHealthRecordsWithName()";
        return db.execute(query);
    }

    static getHealthRecord(recordId) {
        return db.execute("CALL getHealthRecord(?)", [recordId]);
    }

    static addHealthRecord(details) {
        const { height, weight, dateCalculated, bmi, email } = details;

        return db.execute("CALL addHealthRecord (?, ?, ?, ?, ?)", [
            height,
            weight,
            dateCalculated,
            bmi,
            email,
        ]);
    }

    static updateHealthRecord(details) {
        const { recordId, height, weight, dateCalculated, bmi, email } =
            details;

        return db.execute("CALL updateHealthRecord(? ?, ?, ?, ?, ?)", [
            height,
            weight,
            dateCalculated,
            bmi,
            email,
            recordId,
        ]);
    }

    static deleteHealthRecord(recordId) {
        return db.execute("CALL deleteHealthRecord(?)", [recordId]);
    }

    static getHealthRecordsForUser(email) {
        return db.execute("CALL getHealthRecordsForUser(?)", [email]);
    }
};
