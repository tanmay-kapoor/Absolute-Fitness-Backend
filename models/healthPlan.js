import { execute } from "../util/database";

export default class HealthPlan {
    static getHealthPlanForUser(email) {
        const query = "CALL getHealthPlanForUser(?)";
        return execute(query, [email]);
    }
}
