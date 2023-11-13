import { execute } from "../util/database";

export default class Staff {
    static getAllStaff() {
        return execute("CALL getAllStaff()");
    }

    static getStaff(staffId) {
        return execute("CALL getStaff(?)", [staffId]);
    }

    static addStaff(details) {
        const {
            staffId,
            name,
            phone,
            partTime,
            salary,
            description,
            password,
            gymId,
        } = details;

        return execute("CALL addStaff (?, ?, ?, ?, ?, ?, ?, ?)", [
            staffId,
            name,
            phone,
            partTime,
            salary,
            description,
            password,
            gymId,
        ]);
    }

    static updateStaff(details) {
        const {
            staffId,
            name,
            phone,
            partTime,
            salary,
            description,
            password,
        } = details;

        return execute("CALL updateStaff(?, ?, ?, ?, ?, ?, ?)", [
            name,
            phone,
            partTime,
            salary,
            description,
            password,
            staffId,
        ]);
    }

    static deleteStaff(staffId) {
        return execute("CALL deleteStaff(?)", [staffId]);
    }
}
