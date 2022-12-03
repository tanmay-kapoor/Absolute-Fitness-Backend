const db = require("../util/database");

module.exports = class Staff {
    static getAllStaff() {
        return db.execute("SELECT * FROM staff");
    }

    static getStaff(username) {
        return db.execute("SELECT * FROM staff WHERE staff_id = ?", [username]);
    }

    static addStaff(details) {
        const {
            staffId,
            name,
            phone,
            partTime,
            salary,
            description,
            password,
            gymId,
        } = details;
        return db.execute(
            "INSERT INTO staff (staff_id, name, phone, part_time, salary, description, password, gym_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
            [
                staffId,
                name,
                phone,
                partTime,
                salary,
                description,
                password,
                gymId,
            ]
        );
    }

    static updateStaff(details) {
        const {
            staffId,
            name,
            phone,
            partTime,
            salary,
            description,
            password,
            gymId,
        } = details;
        return db.execute(
            "UPDATE staff SET name = ?, phone = ?, part_time = ?, salary = ?, description = ?, password = ?, gym_id = ? WHERE staff_id = ?",
            [
                name,
                phone,
                partTime,
                salary,
                description,
                password,
                gymId,
                staffId,
            ]
        );
    }

    static deleteStaff(staffId) {
        return db.execute("DELETE FROM staff WHERE staff_id = ?", [staffId]);
    }
};
