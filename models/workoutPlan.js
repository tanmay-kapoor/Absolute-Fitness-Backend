const db = require("../util/database");

module.exports = class WorkoutPlan {
    static getAllWorkoutPlans() {
        return db.execute("SELECT * FROM workout_plans");
    }

    static addWorkoutPlan(details) {
        return db.execute(
            "INSERT INTO workout_plans (name, description, excercise_1, excercise_2, excercise_3) VALUES (?, ?, ?, ?, ?)",
            [
                details.name,
                details.description,
                details.excercise1,
                details.excercise2,
                details.excercise3,
            ]
        );
    }

    static updateWorkoutPlan(details) {
        console.log(details);
        const query =
            "UPDATE workout_plans SET " +
            "name = ?, description = ?, excercise_1 = ?, excercise_2 = ?, excercise_3 = ? " +
            "WHERE plan_id = ?";
        return db.execute(query, [
            details.name,
            details.description,
            details.excercise1,
            details.excercise2,
            details.excercise3,
            details.planId,
        ]);
    }

    static deleteWorkoutPlan(planId) {
        return db.execute("DELETE FROM workout_plans WHERE plan_id = ?", [
            planId,
        ]);
    }
};
