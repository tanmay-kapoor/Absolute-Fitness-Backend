const DietPlan = require("../models/dietPlan");

exports.getAllDietPlans = async (req, res) => {
    try {
        const [allDietPlans] = await DietPlan.getAllDietPlans();
        res.status(200).json(allDietPlans);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.addDietPlan = async (req, res) => {
    try {
        const details = setNullIfAbsent(req.body);
        await DietPlan.addDietPlan(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.updateDietPlan = async (req, res) => {
    try {
        const details = setNullIfAbsent(req.body);
        await DietPlan.updateDietPlan({
            planId: req.params["planId"],
            ...details,
        });
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.deleteDietPlan = async (req, res) => {
    try {
        await DietPlan.deleteDietPlan(req.params["planId"]);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

const setNullIfAbsent = (details) => {
    if (!details.description) {
        details.description = null;
    }
    if (!details.breakfast) {
        details.breakfast = null;
    }
    if (!details.lunch) {
        details.lunch = null;
    }
    if (!details.dinner) {
        details.dinner = null;
    }
    return details;
};
