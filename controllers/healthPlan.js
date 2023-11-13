import { getHealthPlanForUser } from "../models/healthPlan";

export async function getHealthPlanForUser(req, res) {
    try {
        const [[healthPlan]] = await getHealthPlanForUser(req.params["email"]);
        res.status(200).json(healthPlan[0]);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}
