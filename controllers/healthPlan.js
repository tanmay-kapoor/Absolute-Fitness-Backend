const HealthPlan = require("../models/healthPlan");

exports.getHealthPlanForUser = async (req, res) => {
    try {
        const [[healthPlan]] = await HealthPlan.getHealthPlanForUser(
            req.params["email"]
        );
        res.status(200).json(healthPlan[0]);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};
