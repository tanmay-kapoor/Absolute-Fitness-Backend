const db = require("../util/database");

module.exports = class Gym {
    static getAllGyms() {
        return db.execute("CALL getAllGyms");
    }

    static getGym(gymId) {
        return db.execute("CALL getGym(?)", [gymId]);
    }

    static addGym(details) {
        const { branch, pincode, phone, location, membershipFee } = details;

        return db.execute("SELECT addGym(?, ?, ?, ?, ?) as gym_id", [
            branch,
            pincode,
            phone,
            location,
            membershipFee,
        ]);
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
