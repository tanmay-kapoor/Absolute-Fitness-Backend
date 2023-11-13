import { Router } from "express";

import {
    getAllDietPlans,
    addDietPlan,
    updateDietPlan,
    deleteDietPlan,
    getDietPlanForUser,
} from "../controllers/dietPlan";
import { verifyAdminPriviledge, verifyToken } from "../util/middleware";

const router = Router();

router.get("/", verifyAdminPriviledge, getAllDietPlans);

router.post("/", verifyAdminPriviledge, addDietPlan);

router.put("/:planId", verifyAdminPriviledge, updateDietPlan);

router.delete("/:planId", verifyAdminPriviledge, deleteDietPlan);

router.get("/:email", verifyToken, getDietPlanForUser);

export default router;
