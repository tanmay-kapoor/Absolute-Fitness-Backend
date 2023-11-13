import {
    getAllDietPlans,
    addDietPlan,
    updateDietPlan,
    deleteDietPlan,
    getDietPlanForUser,
} from "../models/dietPlan";

export async function getAllDietPlans(req, res) {
    try {
        const [[allDietPlans]] = await getAllDietPlans();
        res.status(200).json(allDietPlans);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function addDietPlan(req, res) {
    try {
        const details = setNullIfAbsent(req.body);
        await addDietPlan(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function updateDietPlan(req, res) {
    try {
        const details = setNullIfAbsent(req.body);
        await updateDietPlan({
            planId: req.params["planId"],
            ...details,
        });
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function deleteDietPlan(req, res) {
    try {
        await deleteDietPlan(req.params["planId"]);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getDietPlanForUser(req, res) {
    try {
        const [[dietPlan]] = await getDietPlanForUser(req.params["email"]);
        const data = dietPlan[0];
        const structuredData = {
            email: data.email,
            planId: data.plan_id,
            name: data.name,
            description: data.description,
            meals: [
                {
                    meal: data.breakfast,
                    calories: data.m1_calories,
                    imageUrl: data.m1_url,
                },
                {
                    meal: data.lunch,
                    calories: data.m2_calories,
                    imageUrl: data.m2_url,
                },
                {
                    meal: data.dinner,
                    calories: data.m3_calories,
                    imageUrl: data.m3_url,
                },
            ],
        };
        res.status(200).json(structuredData);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

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
