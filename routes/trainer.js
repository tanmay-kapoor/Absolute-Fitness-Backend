const express = require("express");

const trainerController = require("../controllers/trainer");
const { verifyLoggedIn, verifyAdminPriviledge } = require("../util/middleware");

const router = express.Router();

router.get(
    "/:staffId/memberRecords",
    verifyLoggedIn,
    trainerController.getAllUserHealthRecordsForTrainer
);

router.post("/", verifyAdminPriviledge, trainerController.addTrainer);

module.exports = router;
