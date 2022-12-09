const db = require("../util/database");

module.exports = class Admin {
    static getAdmin(staffId) {
        const query = "CALL getAdmin(?)";
        return db.execute(query, [staffId]);
    }
};
