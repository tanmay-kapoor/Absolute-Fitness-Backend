const express = require("express");

const gymController = require("../controllers/gym");
const {
    verifyAdminPriviledge,
    verifyToken,
    verifyLoggedIn,
} = require("../util/middleware.js");

const router = express.Router();

router.get("/", verifyLoggedIn, gymController.getAllGyms);

router.get("/:gymId", verifyLoggedIn, gymController.getGym);

router.post("/", verifyAdminPriviledge, gymController.addGym);

router.put("/:gymId", verifyAdminPriviledge, gymController.updateGym);

router.delete("/:gymId", verifyAdminPriviledge, gymController.deleteGym);

router.get(
    "/:gymId/facilities",
    verifyLoggedIn,
    gymController.getAllFacilities
);

router.get(
    "/:gymId/equipments",
    verifyLoggedIn,
    gymController.getAllEquipments
);

router.get("/:gymId/trainers", verifyLoggedIn, gymController.getAllTrainers);

router.get("/:gymId/members", verifyLoggedIn, gymController.getAllUsers);

router.get("/:gymId/staff", verifyLoggedIn, gymController.getAllStaff);

router.put(
    "/:gymId/equipment/:equipmentId",
    verifyAdminPriviledge,
    gymController.updateEquipmentForGym
);

module.exports = router;
