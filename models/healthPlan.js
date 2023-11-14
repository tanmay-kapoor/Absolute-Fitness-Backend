const db = require("../util/database");

module.exports = class HealthPlan {
    static getHealthPlanForUser(email) {
        const query = "CALL getHealthPlanForUser(?)";
        return db.execute(query, [email]);
    }
};
