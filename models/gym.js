const db = require("../util/database");

module.exports = class Gym {
    static getAllGyms() {
        return db.execute("SELECT * FROM gyms");
    }

    static getGym(gymId) {
        return db.execute("SELECT * FROM gyms WHERE gym_id = ?", [gymId]);
    }

    static addGym(details) {
        const { phone, location, membershipFee } = details;
        return db.execute(
            "INSERT INTO gyms (phone, location, membership_fee) VALUES (?, ?, ?)",
            [phone, location, membershipFee]
        );
    }

    static updateGym(details) {
        const { gymId, phone, location, membershipFee } = details;
        return db.execute(
            "UPDATE gyms SET phone = ?, location = ?, membership_fee = ? WHERE gym_id = ?",
            [phone, location, membershipFee, gymId]
        );
    }

    static deleteGym(gymId) {
        return db.execute("DELETE FROM gyms WHERE gym_id = ?", [gymId]);
    }
};
