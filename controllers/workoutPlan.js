import {
    getAllWorkoutPlans,
    addWorkoutPlan,
    updateWorkoutPlan,
    deleteWorkoutPlan,
    getWorkoutPlanForUser,
} from "../models/workoutPlan";

export async function getAllWorkoutPlans(req, res) {
    try {
        const [[allWorkoutPlans]] = await getAllWorkoutPlans();
        res.status(200).json(allWorkoutPlans);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function addWorkoutPlan(req, res) {
    try {
        const details = setNullIfAbsent(req.body);
        await addWorkoutPlan(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function updateWorkoutPlan(req, res) {
    try {
        const details = setNullIfAbsent(req.body);
        await updateWorkoutPlan({
            planId: req.params["planId"],
            ...details,
        });
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function deleteWorkoutPlan(req, res) {
    try {
        await deleteWorkoutPlan(req.params["planId"]);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getWorkoutPlanForUser(req, res) {
    try {
        const [[workoutPlan]] = await getWorkoutPlanForUser(
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
}

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
