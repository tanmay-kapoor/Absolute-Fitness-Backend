import { execute } from "../util/database";

export default class User {
    static getAllUsers() {
        return execute("CALL getAllUsers()");
    }

    static getUser(email) {
        return execute("CALL getUser(?)", [email]);
    }

    static addUser(details) {
        const { email, name, dob, phone, sex, gymId, password } = details;

        return execute("CALL addUser(?, ?, ?, ?, ?, ?, ?)", [
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

        return execute("CALL updateUser(?, ?, ?, ?, ?, ?, ?)", [
            name,
            phone,
            dob,
            sex,
            gymId,
            password,
            email,
        ]);
    }

    static deleteUser(email) {
        return execute("CALL deleteUser(?)", [email]);
    }

    static getAllUsersForGym(gymId) {
        return execute("CALL getAllUsersForGym(?)", [gymId]);
    }

    static getAllStaffForGym(gymId) {
        return execute("CALL getAllStaffForGym(?)", [gymId]);
    }
}
