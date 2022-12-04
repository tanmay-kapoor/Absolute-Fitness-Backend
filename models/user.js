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

    static getHealthPlan() {
        const query =
            "SELECT u.email, u.name, " +
            "t.staff_id as trainer_id, " +
            "s.name as trainer_name, s.phone as trainer_phone, " +
            "w.plan_id as workout_plan_id, w.name as workout_plan_name, " +
            "w.description as workout_description, w.excercise_1, w.excercise_2, w.excercise_3, " +
            "d.plan_id as diet_plan_id, d.name as diet_name, d.description as diet_description, " +
            "d.breakfast, d.lunch, d.dinner FROM " +
            "((((users u JOIN health_plans h " +
            "ON h.email = u.email) " +
            "JOIN trainers t " +
            "ON h.trainer_id = t.staff_id) " +
            "JOIN staff s " +
            "ON t.staff_id = s.staff_id) " +
            "JOIN workout_plans w  " +
            "ON h.workout_plan = w.plan_id) " +
            "JOIN diet_plans d " +
            "ON h.diet_plan = d.plan_id";
        return db.execute(query);
    }
};
