const db = require("../util/database");

module.exports = class User {
    static getAllUsers() {
        return db.execute("SELECT * FROM users");
    }

    static getUser(email) {
        return db.execute("SELECT * FROM users WHERE email = ?", [email]);
    }

    static addUser(details) {
        const { email, name, age, sex, password } = details;
        return db.execute(
            "INSERT INTO users (email, name, age, sex, password) VALUES (?, ?, ?, ?, ?)",
            [email, name, age, sex, password]
        );
    }

    static updateUser(details) {
        const { email, name, age, sex, password } = details;
        return db.execute(
            "UPDATE users SET name = ?, age = ?, sex = ?, password = ? WHERE email = ?",
            [name, age, sex, password, email]
        );
    }

    static deleteUser(email) {
        return db.execute("DELETE FROM users WHERE email = ?", [email]);
    }
};
