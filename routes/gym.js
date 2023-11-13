import { Router } from "express";

import {
    getAllGyms,
    getGym,
    addGym,
    updateGym,
    deleteGym,
    getAllFacilities,
    getAllEquipments,
    getAllTrainers,
    getAllUsers,
    getAllStaff,
    updateEquipmentForGym,
} from "../controllers/gym";
import {
    verifyAdminPriviledge,
    verifyToken,
    verifyLoggedIn,
} from "../util/middleware.js";

const router = Router();

router.get("/", verifyLoggedIn, getAllGyms);

router.get("/:gymId", verifyLoggedIn, getGym);

router.post("/", verifyAdminPriviledge, addGym);

router.put("/:gymId", verifyAdminPriviledge, updateGym);

router.delete("/:gymId", verifyAdminPriviledge, deleteGym);

router.get("/:gymId/facilities", verifyLoggedIn, getAllFacilities);

router.get("/:gymId/equipments", verifyAdminPriviledge, getAllEquipments);

router.get("/:gymId/trainers", verifyLoggedIn, getAllTrainers);

router.get("/:gymId/members", verifyAdminPriviledge, getAllUsers);

router.get("/:gymId/staff", verifyAdminPriviledge, getAllStaff);

router.put(
    "/:gymId/equipment/:equipmentId",
    verifyAdminPriviledge,
    updateEquipmentForGym
);

export default router;
