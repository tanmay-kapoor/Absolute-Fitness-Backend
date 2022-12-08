const db = require("../util/database");

module.exports = class HealthPlan {
    static getHealthPlanForUser(email) {
        const query =
            "SELECT u.email, u.name, " +
            "t.staff_id as trainer_id, t.image_url as trainer_url, " +
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
            "ON h.diet_plan = d.plan_id " +
            "HAVING email = ?";

        // const query = "CALL getHealthPlanForUser(?)";
        return db.execute(query, [email]);
    }
};
