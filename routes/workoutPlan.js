import { Router } from "express";

import {
    getAllWorkoutPlans,
    addWorkoutPlan,
    updateWorkoutPlan,
    deleteWorkoutPlan,
    getWorkoutPlanForUser,
} from "../controllers/workoutPlan";
import { verifyMember, verifyEmployeeNotSpecific } from "../util/middleware";

const router = Router();

router.get("/", verifyEmployeeNotSpecific, getAllWorkoutPlans);

router.post("/", verifyEmployeeNotSpecific, addWorkoutPlan);

router.put("/:planId", verifyEmployeeNotSpecific, updateWorkoutPlan);

router.delete("/:planId", verifyEmployeeNotSpecific, deleteWorkoutPlan);

router.get("/:email", verifyMember, getWorkoutPlanForUser);

export default router;
