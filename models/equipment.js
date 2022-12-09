const db = require("../util/database");

module.exports = class Equipment {
    static getAllEquipmentsForGym(gymId) {
        return db.execute("CALL getAllEquipmentsForGym(?)", [gymId]);
    }
};
