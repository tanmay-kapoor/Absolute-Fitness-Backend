const db = require("../util/database");

module.exports = class Equipment {
    static getAllEquipmentsForGym(gymId) {
        return db.execute("CALL getAllEquipmentsForGym(?)", [gymId]);
    }

    static updateEquipmentForGym(details) {
        const { gymId, equipmentId, quantity, lastServiced } = details;
        return db.execute("CALL updateEquipmentForGym(?, ?, ?, ?)", [
            gymId,
            equipmentId,
            quantity,
            lastServiced,
        ]);
    }
};
