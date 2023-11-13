import { Router } from "express";

import { getHealthPlanForUser } from "../controllers/healthPlan";
import { verifyMember } from "../util/middleware.js";

const router = Router();

router.get("/:email", verifyMember, getHealthPlanForUser);

export default router;
