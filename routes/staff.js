import { Router } from "express";

import {
    getAllStaff,
    getStaff,
    authenticate,
    addStaff,
    updateStaff,
    deleteStaff,
} from "../controllers/staff";
import { verifyEmployee, verifyAdminPriviledge } from "../util/middleware";

const router = Router();

router.get("/", verifyAdminPriviledge, getAllStaff);

router.get("/:staffId", verifyEmployee, getStaff);

router.post("/login", authenticate);

router.post("/signup", verifyAdminPriviledge, addStaff);

router.put("/:staffId", verifyEmployee, updateStaff);

router.delete("/:staffId", verifyEmployee, deleteStaff);

export default router;
