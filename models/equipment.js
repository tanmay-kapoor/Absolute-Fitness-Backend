const db = require("../util/database");

module.exports = class Equipment {
    static getAllEquipmentsForGym(gymId) {
        return db.execute("SELECT * FROM equipments WHERE gym_id = ?", [gymId]);
        // return db.execute("CALL getAllEquipmentsForGym(?)", [gymId]);
    }
};
