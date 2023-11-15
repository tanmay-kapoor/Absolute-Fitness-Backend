const express = require("express");

const trainerController = require("../controllers/trainer");
const {
    verifyLoggedIn,
    verifyAdminPriviledge,
    verifyEmployee,
} = require("../util/middleware");

const router = express.Router();

router.get(
    "/:staffId/memberRecords",
    verifyLoggedIn,
    trainerController.getAllUserHealthRecordsForTrainer
);

router.get("/:staffId", verifyEmployee, trainerController.getTrainer);

router.post("/", verifyAdminPriviledge, trainerController.addTrainer);

router.put("/:staffId", verifyEmployee, trainerController.updateTrainer);

module.exports = router;
