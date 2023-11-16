const express = require("express");

const trainerController = require("../controllers/trainer");
const {
    verifyLoggedIn,
    verifyAdminPriviledge,
    verifyAdminPriviledgeOfSameGym,
    verifyEmployeeOrAdminOfSameGym,
    verifyEmployee,
} = require("../util/middleware");

const router = express.Router();

router.get(
    "/:staffId/memberRecords",
    verifyLoggedIn,
    trainerController.getAllUserHealthRecordsForTrainer
);

router.get("/:staffId", verifyEmployee, trainerController.getTrainer);

router.post("/", verifyAdminPriviledgeOfSameGym, trainerController.addTrainer);

router.put(
    "/:staffId",
    verifyEmployeeOrAdminOfSameGym,
    trainerController.updateTrainer
);

module.exports = router;
