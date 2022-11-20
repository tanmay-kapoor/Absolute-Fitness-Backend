const db = require("../util/database");

module.exports = class User {
    static getAllUsers() {
        return db.execute("SELECT * FROM users");
    }

    static getUser(email) {
        return db.execute("SELECT * FROM users WHERE email = ?", [email]);
    }

    static addUser(email, name, password) {
        return db.execute(
            "INSERT INTO users (email, name, password) VALUES (?, ?, ?)",
            [email, name, password]
        );
    }

    static updateUser(email, name, password) {
        return db.execute(
            "UPDATE users SET name = ?, password = ? WHERE email = ?",
            [name, password, email]
        );
    }

    static deleteUser(email) {
        return db.execute("DELETE FROM users WHERE email = ?", [email]);
    }
};
