const express = require("express");

const gymController = require("../controllers/gym");

const router = express.Router();

router.get("/", gymController.getAllGyms);
router.get("/:gymId", gymController.getGym);
router.post("/", gymController.addGym);
router.put("/:gymId", gymController.updateGym);
router.delete("/:gymId", gymController.deleteGym);
router.get("/:gymId/facilities", gymController.getAllFacilities);

module.exports = router;
