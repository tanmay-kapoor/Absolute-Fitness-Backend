import { execute } from "../util/database";

export default class DietPlan {
    static getAllDietPlans() {
        const query = "CALL getAllDietPlans()";
        return execute(query);
    }

    static addDietPlan(details) {
        const { name, description, breakfast, lunch, dinner } = details;

        return execute("CALL addDietPlan (?, ?, ?, ?, ?)", [
            name,
            description,
            breakfast,
            lunch,
            dinner,
        ]);
    }

    static updateDietPlan(details) {
        const { name, description, breakfast, lunch, db, planId } = details;

        const query = "CALL updateDietPlan(?, ?, ?, ?, ?, ?)";
        return db.execute(query, [
            name,
            description,
            breakfast,
            lunch,
            dinner,
            planId,
        ]);
    }

    static deleteDietPlan(planId) {
        return execute("CALL deleteDietPlan (?)", [planId]);
    }

    static getDietPlanForUser(email) {
        const query = "CALL getDietPlanForUser(?)";
        return execute(query, [email]);
    }
}
