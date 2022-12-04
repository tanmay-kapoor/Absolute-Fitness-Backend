const WorkoutPlan = require("../models/workoutPlan");

exports.getAllWorkoutPlans = async (req, res) => {
    try {
        const [allWorkoutPlans] = await WorkoutPlan.getAllWorkoutPlans();
        res.status(200).json(allWorkoutPlans);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.addWorkoutPlan = async (req, res) => {
    try {
        const details = setNullIfAbsent(req.body);
        await WorkoutPlan.addWorkoutPlan(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.updateWorkoutPlan = async (req, res) => {
    try {
        const details = setNullIfAbsent(req.body);
        await WorkoutPlan.updateWorkoutPlan({
            planId: req.params["planId"],
            ...details,
        });
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.deleteWorkoutPlan = async (req, res) => {
    try {
        await WorkoutPlan.deleteWorkoutPlan(req.params["planId"]);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

const setNullIfAbsent = (details) => {
    if (!details.excercise1) {
        details.excercise1 = null;
    }
    if (!details.excercise2) {
        details.excercise2 = null;
    }
    if (!details.excercise3) {
        details.excercise3 = null;
    }
    return details;
};
