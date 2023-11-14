const express = require("express");

const trainerController = require("../controllers/trainer");
const { verifyLoggedIn } = require("../util/middleware");

const router = express.Router();

router.get(
    "/:staffId/memberRecords",
    verifyLoggedIn,
    trainerController.getAllUserHealthRecordsForTrainer
);

module.exports = router;
