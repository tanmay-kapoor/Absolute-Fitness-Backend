import { execute } from "../util/database";

export default class Gym {
    static getAllGyms() {
        return execute("CALL getAllGyms");
    }

    static getGym(gymId) {
        return execute("CALL getGym(?)", [gymId]);
    }

    static addGym(details) {
        const { imageUrl, phone, location, membershipFee } = details;

        return execute("CALL addGym (?, ?, ?, ?)", [
            imageUrl,
            phone,
            location,
            membershipFee,
        ]);
    }

    static updateGym(details) {
        const { gymId, imageUrl, phone, location, membershipFee } = details;

        const query = "CALL updateGym(?, ?, ?, ?, ?)";
        return execute(query, [
            imageUrl,
            phone,
            location,
            membershipFee,
            gymId,
        ]);
    }

    static deleteGym(gymId) {
        return execute("CALL deleteGym(?)", [gymId]);
    }
}
