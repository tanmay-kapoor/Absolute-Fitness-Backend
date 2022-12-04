const db = require("../util/database");

module.exports = class DietPlan {
    static getAllDietPlans() {
        const query =
            "SELECT d.*, m1.calories as breakfast_calories, m1.image_url as breakfast_url, " +
            "m2.calories as lunch_calories, m2.image_url as lunch_url, " +
            "m3.calories as dinner_calories, m3.image_url as dinner_url " +
            "FROM ((diet_plans d LEFT JOIN meal_choices m1 on d.breakfast = m1.meal) " +
            "LEFT JOIN meal_choices m2 ON d.lunch = m2.meal) " +
            "LEFT JOIN meal_choices m3 ON d.dinner = m3.meal;";
        return db.execute(query);
    }

    static addDietPlan(details) {
        return db.execute(
            "INSERT INTO diet_plans (name, description, breakfast, lunch, dinner) VALUES (?, ?, ?, ?, ?)",
            [
                details.name,
                details.description,
                details.breakfast,
                details.lunch,
                details.dinner,
            ]
        );
    }

    static updateDietPlan(details) {
        const query =
            "UPDATE diet_plans SET " +
            "name = ?, description = ?, breakfast = ?, lunch = ?, dinner = ? " +
            "WHERE plan_id = ?";
        return db.execute(query, [
            details.name,
            details.description,
            details.breakfast,
            details.lunch,
            details.dinner,
            details.planId,
        ]);
    }

    static deleteDietPlan(planId) {
        return db.execute("DELETE FROM diet_plans WHERE plan_id = ?", [planId]);
    }
};
