const db = require("../util/database");

module.exports = class Facility {
    static getAllFacilitiesForGym(gymId) {
        return db.execute("CALL getAllFacilitiesForGym(?)", [gymId]);
    }
};
