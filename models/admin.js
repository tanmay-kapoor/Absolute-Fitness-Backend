const db = require("../util/database");

module.exports = class Admin {
    static getAllAdmins() {
        const query = "CALL getAllAdmins()";
        return db.execute(query);
    }

    static getAdmin(staffId) {
        const query = "CALL getAdmin(?)";
        return db.execute(query, [staffId]);
    }

    static getAllAdminsForGym(gymId) {
        const query = "CALL getAllAdminsForGym(?)";
        return db.execute(query, [gymId]);
    }

    static createNewAdminForGym(details) {
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
        } = details;

        const query = "CALL createNewAdminForGym(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return db.execute(query, [
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
        ]);
    }
};
