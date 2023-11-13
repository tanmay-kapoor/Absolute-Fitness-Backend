import { execute } from "../util/database";

export default class HealthRecord {
    static getAllHealthRecords() {
        return execute("CALL getAllHealthRecords()");
    }

    static getAllHealthRecordsWithName() {
        const query = "CALL getAllHealthRecordsWithName()";
        return execute(query);
    }

    static getHealthRecord(recordId) {
        return execute("CALL getHealthRecord(?)", [recordId]);
    }

    static addHealthRecord(details) {
        const { height, weight, dateCalculated, bmi, email } = details;

        return execute("CALL addHealthRecord (?, ?, ?, ?, ?)", [
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

        return execute("CALL updateHealthRecord(? ?, ?, ?, ?, ?)", [
            height,
            weight,
            dateCalculated,
            bmi,
            email,
            recordId,
        ]);
    }

    static deleteHealthRecord(recordId) {
        return execute("CALL deleteHealthRecord(?)", [recordId]);
    }

    static getHealthRecordsForUser(email) {
        return execute("CALL getHealthRecordsForUser(?)", [email]);
    }
}
