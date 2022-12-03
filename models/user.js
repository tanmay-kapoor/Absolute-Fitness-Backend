const db = require("../util/database");

module.exports = class User {
    static getAllUsers() {
        return db.execute("SELECT * FROM users");
    }

    static getUser(username) {
        return db.execute("SELECT * FROM users WHERE email = ? OR phone = ?", [
            username,
            username,
        ]);
    }

    static addUser(details) {
        const { email, name, dob, phone, sex, gymId, password } = details;
        return db.execute(
            "INSERT INTO users (email, name, phone, dob, sex, gym_id, password) VALUES (?, ?, ?, ?, ?, ?, ?)",
            [email, name, phone, dob, sex, gymId, password]
        );
    }

    static updateUser(details) {
        const { email, name, phone, dob, sex, gymId, password } = details;
        return db.execute(
            "UPDATE users SET name = ?, phone = ?, dob = ?, sex = ?, gym_id = ? password = ? WHERE email = ?",
            [name, dob, phone, sex, gymId, password, email]
        );
    }

    static deleteUser(username) {
        return db.execute("DELETE FROM users WHERE email = ? OR phone = ?", [
            username,
            username,
        ]);
    }
};
