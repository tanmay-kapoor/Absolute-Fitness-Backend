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

exports.getWorkoutPlanForUser = async (req, res) => {
    try {
        const [workoutPlan] = await WorkoutPlan.getWorkoutPlanForUser(
            req.params["email"]
        );
        const data = workoutPlan[0];
        const structuredData = {
            email: data.email,
            planId: data.plan_id,
            name: data.name,
            description: data.description,
            excercises: [
                {
                    excercise: data.excercise_1,
                    sets: data.e1_sets,
                    reps: data.e1_reps,
                    imageUrl: data.e1_url,
                },
                {
                    excercise: data.excercise_2,
                    sets: data.e2_sets,
                    reps: data.e2_reps,
                    imageUrl: data.e2_url,
                },
                {
                    excercise: data.excercise_3,
                    sets: data.e3_sets,
                    reps: data.e3_reps,
                    imageUrl: data.e3_url,
                },
            ],
        };
        res.status(200).json(structuredData);
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
