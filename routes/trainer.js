import { Router } from "express";

import { getAllUserHealthRecordsForTrainer } from "../controllers/trainer";
import { verifyLoggedIn } from "../util/middleware";

const router = Router();

router.get(
    "/:staffId/memberRecords",
    verifyLoggedIn,
    getAllUserHealthRecordsForTrainer
);

export default router;
