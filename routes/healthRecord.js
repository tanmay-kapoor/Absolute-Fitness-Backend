import { Router } from "express";

import {
    getAllHealthRecords,
    getAllHealthRecordsWithName,
    addHealthRecord,
    updateHealthRecord,
    deleteHealthRecord,
    getHealthRecordsForUser,
} from "../controllers/healthRecord";
import {
    verifyToken,
    verifyMember,
    verifyAdminPriviledge,
} from "../util/middleware";

const router = Router();

router.get("/", verifyAdminPriviledge, getAllHealthRecords);

router.get("/withName", verifyAdminPriviledge, getAllHealthRecordsWithName);

router.post("/", verifyMember, addHealthRecord);

router.put("/:recordId", verifyMember, updateHealthRecord);

router.delete("/:recordId", verifyMemberWithoutEmail, deleteHealthRecord);

router.get("/:email", verifyToken, getHealthRecordsForUser);

export default router;
