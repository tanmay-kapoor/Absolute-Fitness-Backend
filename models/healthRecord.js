const db = require("../util/database");

module.exports = class HealthRecord {
    static getAllHealthRecords() {
        return db.execute("SELECT * FROM health_records");
    }

    static getAllHealthRecordsWithName() {
        const query =
            "SELECT * FROM health_records h LEFT JOIN users u ON h.email = u.email";
        return db.execute(query);
    }

    static getHealthRecord(recordId) {
        return db.execute("SELECT * FROM health_records WHERE record_id = ?", [
            recordId,
        ]);
    }

    static addHealthRecord(details) {
        const { height, weight, dateCalculated, bmi, email } = details;
        return db.execute(
            "INSERT INTO health_records (height, weight, date_calculated, BMI, email) VALUES (?, ?, ?, ?, ?)",
            [height, weight, dateCalculated, bmi, email]
        );
    }

    static updateHealthRecord(details) {
        const { recordId, height, weight, dateCalculated, bmi, email } =
            details;
        return db.execute(
            "UPDATE health_records SET height = ?, weight = ?, date_calculated = ?, BMI = ?, email = ? WHERE record_id = ?",
            [height, weight, dateCalculated, bmi, email, recordId]
        );
    }

    static deleteHealthRecord(recordId) {
        return db.execute("DELETE FROM health_records WHERE record_id = ?", [
            recordId,
        ]);
    }
};
