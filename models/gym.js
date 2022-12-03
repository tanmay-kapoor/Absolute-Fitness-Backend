const db = require("../util/database");

module.exports = class Gym {
    static getAllGyms() {
        return db.execute("SELECT * FROM gyms");
    }

    static getGym(gymId) {
        return db.execute("SELECT * FROM gyms WHERE gym_id = ?", [gymId]);
    }

    static addGym(details) {
        const { imageUrl, phone, location, membershipFee } = details;
        return db.execute(
            "INSERT INTO gyms (image_url, phone, location, membership_fee) VALUES (?, ?, ?, ?)",
            [imageUrl, phone, location, membershipFee]
        );
    }

    static updateGym(details) {
        const { gymId, imageUrl, phone, location, membershipFee } = details;
        return db.execute(
            "UPDATE gyms SET image_url = ?, phone = ?, location = ?, membership_fee = ? WHERE gym_id = ?",
            [imageUrl, phone, location, membershipFee, gymId]
        );
    }

    static deleteGym(gymId) {
        return db.execute("DELETE FROM gyms WHERE gym_id = ?", [gymId]);
    }

    static getAllFacilities(gymId) {
        return db.execute("SELECT * FROM facilities WHERE gym_id = ?", [gymId]);
    }

    static getAllEquipments(gymId) {
        return db.execute("SELECT * FROM equipments WHERE gym_id = ?", [gymId]);
    }

    static getAllTrainers(gymId) {
        return db.execute(
            "SELECT name, speciality, s.staff_id, years_of_exp, t.image_url, description, g.gym_id FROM (staff s JOIN trainers t ON s.staff_id = t.staff_id) JOIN gyms g ON s.gym_id = g.gym_id HAVING g.gym_id = ?",
            [gymId]
        );
    }
};
