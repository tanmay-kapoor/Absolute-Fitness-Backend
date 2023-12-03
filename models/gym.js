const db = require("../util/database");

module.exports = class Gym {
    static getAllGyms() {
        return db.execute("CALL getAllGyms");
    }

    static getGym(gymId) {
        return db.execute("CALL getGym(?)", [gymId]);
    }

    static async addGym(details) {
        const { branch, pincode, phone, location, membershipFee } = details;

        await db.execute("CALL addGym (?, ?, ?, ?, ?, @gym_id)", [
            branch,
            pincode,
            phone,
            location,
            membershipFee,
        ]);
        return db.execute("SELECT @gym_id AS gym_id");
    }

    static addImageUrlForGym(imageUrl, gymId) {
        return db.execute("CALL addImageUrlForGym(?, ?)", [imageUrl, gymId]);
    }

    static updateGym(details) {
        const { gymId, imageUrl, phone, location, membershipFee } = details;

        const query = "CALL updateGym(?, ?, ?, ?, ?)";
        return db.execute(query, [
            imageUrl,
            phone,
            location,
            membershipFee,
            gymId,
        ]);
    }

    static deleteGym(gymId) {
        return db.execute("CALL deleteGym(?)", [gymId]);
    }
};
