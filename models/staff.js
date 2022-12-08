const db = require("../util/database");

module.exports = class Staff {
    static getAllStaff() {
        return db.execute("SELECT * FROM staff");
        // return db.execute("CALL getAllStaff()");
    }

    static getStaff(staffId) {
        return db.execute("SELECT * FROM staff WHERE staff_id = ?", [staffId]);
        // return db.execute("CALL getStaff(?)", [staffId]);
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

        // return db.execute(
        //     "CALL addStaff (?, ?, ?, ?, ?, ?, ?, ?)",
        //     [
        //         staffId,
        //         name,
        //         phone,
        //         partTime,
        //         salary,
        //         description,
        //         password,
        //         gymId,
        //     ]
        // );
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
        } = details;

        return db.execute(
            "UPDATE staff SET name = ?, phone = ?, part_time = ?, salary = ?, description = ?, password = ? WHERE staff_id = ?",
            [name, phone, partTime, salary, description, password, staffId]
        );

        // return db.execute(
        //     "CALL updateStaff(?, ?, ?, ?, ?, ?, ?)",
        //     [name, phone, partTime, salary, description, password, staffId]
        // );
    }

    static deleteStaff(staffId) {
        return db.execute("DELETE FROM staff WHERE staff_id = ?", [staffId]);
        // return db.execute("CALL deleteStaff(?)", [staffId]);
    }
};
