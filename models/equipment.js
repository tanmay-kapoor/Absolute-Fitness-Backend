import { execute } from "../util/database";

export default class Equipment {
    static getAllEquipmentsForGym(gymId) {
        return execute("CALL getAllEquipmentsForGym(?)", [gymId]);
    }

    static updateEquipmentForGym(details) {
        const { gymId, equipmentId, quantity, lastServiced } = details;
        return execute("CALL updateEquipmentForGym(?, ?, ?, ?)", [
            gymId,
            equipmentId,
            quantity,
            lastServiced,
        ]);
    }
}
