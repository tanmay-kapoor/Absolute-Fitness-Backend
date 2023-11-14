const db = require("../util/database");
const ResetToken = require("./resetToken");

module.exports = class User {
    static getAllUsers() {
        return db.execute("CALL getAllUsers()");
    }

    static getUser(email) {
        return db.execute("CALL getUser(?)", [email]);
    }

    static addUser(details) {
        const { email, name, dob, phone, sex, gymId, password } = details;

        return db.execute("CALL addUser(?, ?, ?, ?, ?, ?, ?)", [
            email,
            name,
            phone,
            dob,
            sex,
            gymId,
            password,
        ]);
    }

    static updateUser(details) {
        const { email, name, phone, dob, sex, gymId, password } = details;

        return db.execute("CALL updateUser(?, ?, ?, ?, ?, ?, ?)", [
            name,
            phone,
            dob,
            sex,
            gymId,
            password,
            email,
        ]);
    }

    static resetPassword(details) {
        const { email, token, password } = details;

        if (!ResetToken.isValidToken({ email, token })) {
            throw new Error("Invalid token");
        }

        return db.execute("CALL resetPassword(?, ?)", [email, password]);
    }

    static deleteUser(email) {
        return db.execute("CALL deleteUser(?)", [email]);
    }

    static getAllUsersForGym(gymId) {
        return db.execute("CALL getAllUsersForGym(?)", [gymId]);
    }

    static getAllStaffForGym(gymId) {
        return db.execute("CALL getAllStaffForGym(?)", [gymId]);
    }
};
