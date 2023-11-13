import { execute } from "../util/database";

export default class WorkoutPlan {
    static getAllWorkoutPlans() {
        const query = "CALL getAllWorkoutPlans()";
        return execute(query);
    }

    static addWorkoutPlan(details) {
        const { name, description, excercise1, excercise2, excercise3 } = {
            details,
        };

        return execute("CALL addWorkoutPlan (?, ?, ?, ?, ?)", [
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
        } = details;

        const query = "CALL updateWorkoutPlan(?, ?, ?, ?, ?, ?)";
        return execute(query, [
            name,
            description,
            excercise1,
            excercise2,
            excercise3,
            planId,
        ]);
    }

    static deleteWorkoutPlan(planId) {
        return execute("CALL deleteWorkoutPlan(?)", [planId]);
    }

    static getWorkoutPlanForUser(email) {
        const query = "CALL getWorkoutPlanForUser(?)";
        return execute(query, [email]);
    }
}
