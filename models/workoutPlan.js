const db = require("../util/database");

module.exports = class WorkoutPlan {
    static getAllWorkoutPlans() {
        const query =
            "SELECT w.*, e1.image_url as e1_url, e1.sets as e1_sets, e1.reps as e1_reps, " +
            "e2.image_url as e2_url, e2.sets as e2_sets, e2.reps as e2_reps, " +
            "e3.image_url as e3_url, e3.sets as e3_sets, e3.reps as e3_reps FROM " +
            "((workout_plans w LEFT JOIN excercises e1 " +
            "ON w.excercise_1 = e1.name) " +
            "LEFT JOIN excercises e2 " +
            "ON w.excercise_2 = e2.name) " +
            "LEFT JOIN excercises e3 " +
            "ON w.excercise_3 = e3.name;";
        return db.execute(query);
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

    static getWorkoutPlanForUser(email) {
        const query =
            "SELECT h.email, w.*, " +
            "e1.sets as e1_sets, e1.reps as e1_reps, e1.image_url as e1_url, " +
            "e2.sets as e2_sets, e2.reps as e2_reps, e2.image_url as e2_url, " +
            "e3.sets as e3_sets, e3.reps as e3_reps, e3.image_url as e3_url FROM " +
            "health_plans h JOIN workout_plans w ON " +
            "h.workout_plan = w.plan_id " +
            "LEFT JOIN excercises e1 ON w.excercise_1 = e1.name " +
            "LEFT JOIN excercises e2 ON w.excercise_2 = e2.name " +
            "LEFT JOIN excercises e3 ON w.excercise_3 = e3.name " +
            "HAVING h.email = ?";
        return db.execute(query, [email]);
    }
};
