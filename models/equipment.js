const db = require("../util/database");

module.exports = class Equipment {
    static getAllEquipmentsForGym(gymId) {
        return db.execute("CALL getAllEquipmentsForGym(?)", [gymId]);
    }

    static addEquipment(details) {
        const { name, imageUrl } = details;
        return db.execute("CALL addEquipment(?, ?)", [name, imageUrl]);
    }

    static addEquipmentForGym(details) {
        const { gymId, equipmentId, name, imageUrl, quantity, lastServiced } =
            details;
        return db.execute("CALL addEquipmentForGym(?, ?, ?, ?, ?, ?)", [
            gymId,
            equipmentId,
            name,
            imageUrl,
            quantity,
            lastServiced,
        ]);
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

    static deleteEquipmentForGym(details) {
        const { gymId, equipmentId } = details;
        return db.execute("CALL deleteEquipmentForGym(?, ?)", [
            gymId,
            equipmentId,
        ]);
    }
};
