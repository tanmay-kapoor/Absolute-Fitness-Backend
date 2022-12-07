const express = require("express");

const trainerController = require("../controllers/trainer");

const router = express.Router();

router.get(
    "/:staffId/members",
    trainerController.getAllUserHealthRecordsForTrainer
);

module.exports = router;