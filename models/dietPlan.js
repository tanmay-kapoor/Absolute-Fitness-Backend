const db = require("../util/database");

module.exports = class DietPlan {
    static getAllDietPlans() {
        const query = "CALL getAllDietPlans()";
        return db.execute(query);
    }

    static addDietPlan(details) {
        const { name, description, breakfast, lunch, dinner } = { details };

        return db.execute("CALL addDietPlan (?, ?, ?, ?, ?)", [
            name,
            description,
            breakfast,
            lunch,
            dinner,
        ]);
    }

    static updateDietPlan(details) {
        const { name, description, breakfast, lunch, db, planId } = { details };

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
        return db.execute("CALL deleteDietPlan (?)", [planId]);
    }

    static getDietPlanForUser(email) {
        const query = "CALL getDietPlanForUser(?)";
        return db.execute(query, [email]);
    }
};
