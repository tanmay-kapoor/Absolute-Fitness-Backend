const db = require("../util/database");

module.exports = class DietPlan {
    static getAllDietPlans() {
        return db.execute("SELECT * FROM diet_plans");
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
