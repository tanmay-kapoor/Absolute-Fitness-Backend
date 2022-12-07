const express = require("express");

const gymController = require("../controllers/gym");

const router = express.Router();

router.get("/", gymController.getAllGyms);

router.get("/:gymId", gymController.getGym);

router.post("/", gymController.addGym);

router.put("/:gymId", gymController.updateGym);

router.delete("/:gymId", gymController.deleteGym);

router.get("/:gymId/facilities", gymController.getAllFacilities);

router.get("/:gymId/equipments", gymController.getAllEquipments);

router.get("/:gymId/trainers", gymController.getAllTrainers);

router.get("/:gymId/members", gymController.getAllUsers);

router.get("/:gymId/staff", gymController.getAllStaff);

module.exports = router;
