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

    static addAdminForGym(details) {
        const { staffId, gymId } = details;

        const query = "CALL addAdminForGym(?, ?)";
        return db.execute(query, [staffId, gymId]);
    }
};
