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

    static randomlyAssignHealthPlan(details) {
        const { gymId, email } = details;

        return db.execute("CALL randomly_assign_health_plan(?, ?)", [
            gymId,
            email,
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

    static promoteToPayingCustomer(email) {
        return db.execute("CALL promoteToPayingCustomer(?)", [email]);
    }

    static resetPassword(details) {
        const { username, token, password } = details;

        if (!ResetToken.isValidResetToken({ username, token })) {
            throw new Error("Invalid token");
        }

        return db.execute("CALL resetPassword(?, ?)", [username, password]);
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
