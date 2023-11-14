const express = require("express");

const gymController = require("../controllers/gym");
const {
  verifyAdminPriviledge,
  verifyToken,
  verifyLoggedIn,
} = require("../util/middleware.js");

const router = express.Router();

router.get("/", gymController.getAllGyms);

router.get("/:gymId", verifyLoggedIn, gymController.getGym);

router.get("/:gymId/facilities", gymController.getAllFacilities);

router.get("/:gymId/equipments", gymController.getAllEquipments);

router.get("/:gymId/trainers", gymController.getAllTrainers);

router.get("/:gymId/members", verifyAdminPriviledge, gymController.getAllUsers);

router.get("/:gymId/staff", verifyAdminPriviledge, gymController.getAllStaff);

router.post("/", verifyAdminPriviledge, gymController.addGym);

router.put("/:gymId", verifyAdminPriviledge, gymController.updateGym);

router.put(
  "/:gymId/equipment/:equipmentId",
  verifyAdminPriviledge,
  gymController.updateEquipmentForGym
);

router.delete("/:gymId", verifyAdminPriviledge, gymController.deleteGym);

module.exports = router;
