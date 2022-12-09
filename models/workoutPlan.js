const db = require("../util/database");

module.exports = class WorkoutPlan {
    static getAllWorkoutPlans() {
        const query = "CALL getAllWorkoutPlans()";
        return db.execute(query);
    }

    static addWorkoutPlan(details) {
        const { name, description, excercise1, excercise2, excercise3 } = {
            details,
        };

        return db.execute("CALL addWorkoutPlan (?, ?, ?, ?, ?)", [
            name,
            description,
            excercise1,
            excercise2,
            excercise3,
        ]);
    }

    static updateWorkoutPlan(details) {
        const {
            name,
            description,
            excercise1,
            excercise2,
            excercise3,
            planId,
        } = { details };

        const query = "CALL updateWorkoutPlan(?, ?, ?, ?, ?, ?)";
        return db.execute(query, [
            name,
            description,
            excercise1,
            excercise2,
            excercise3,
            planId,
        ]);
    }

    static deleteWorkoutPlan(planId) {
        return db.execute("CALL deleteWorkoutPlan(?)", [planId]);
    }

    static getWorkoutPlanForUser(email) {
        const query = "CALL getWorkoutPlanForUser(?)";
        return db.execute(query, [email]);
    }
};
