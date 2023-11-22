const db = require("../util/database");

module.exports = class Equipment {
    static getAllEquipments() {
        return db.execute("CALL getAllEquipments()");
    }

    static getEquipment(equipmentId) {
        return db.execute("CALL getEquipment(?)", [equipmentId]);
    }

    static addEquipment(details) {
        const { name, imageUrl } = details;
        return db.execute("CALL addEquipment(?, ?, ?)", [name, imageUrl, null]);
    }

    static updateEquipment(details) {
        const { equipmentId, name, imageUrl } = details;
        return db.execute("CALL updateEquipment(?, ?, ?)", [
            equipmentId,
            name,
            imageUrl,
        ]);
    }

    static deleteEquipment(equipmentId) {
        return db.execute("CALL deleteEquipment(?)", [equipmentId]);
    }

    static getAllEquipmentsForGym(gymId) {
        return db.execute("CALL getAllEquipmentsForGym(?)", [gymId]);
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
