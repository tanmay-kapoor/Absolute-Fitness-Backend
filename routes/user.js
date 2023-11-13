import { Router } from "express";

import {
    getAllUsers,
    getUser,
    authenticate,
    addUser,
    updateUser,
    deleteUser,
} from "../controllers/user";
import {
    verifyAdminPriviledge,
    verifyToken,
    verifyMember,
} from "../util/middleware.js";

const router = Router();

router.get("/", verifyAdminPriviledge, getAllUsers);

router.get("/:email", verifyToken, getUser);

router.post("/login", authenticate);

router.post("/signup", addUser);

router.put("/:email", verifyMember, updateUser);

router.delete("/:email", verifyToken, deleteUser);

export default router;
