const db = require("../util/database");

module.exports = class Admin {
    static getAdmin(staffId) {
        const query =
            "SELECT * FROM " +
            "staff s JOIN gym_admins a " +
            "ON s.staff_id = a.staff_id " +
            "HAVING a.staff_id = ?";

        // const query = "CALL getAdmin(?)";
        return db.execute(query, [staffId]);
    }
};
