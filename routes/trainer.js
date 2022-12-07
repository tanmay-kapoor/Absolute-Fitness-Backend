const express = require("express");

const trainerController = require("../controllers/trainer");

const router = express.Router();

router.get(
    "/:staffId/memberRecords",
    trainerController.getAllUserHealthRecordsForTrainer
);

module.exports = router;
