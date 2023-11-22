const trainerController = require("../controllers/trainer");
const upload = require("../util/middlewares/fileUpload");
const uploadImageToS3 = require("../util/middlewares/uploadImageToS3");
const {
    verifyLoggedIn,
    verifyAdminPriviledgeOfSameGym,
    verifyEmployeeOrAdminOfSameGym,
    verifyEmployee,
} = require("../util/middlewares/authentication");

const express = require("express");
const router = express.Router();

router.get(
    "/:staffId/memberRecords",
    verifyLoggedIn,
    trainerController.getAllUserHealthRecordsForTrainer
);

router.get("/:staffId", verifyEmployee, trainerController.getTrainer);

router.post(
    "/",
    verifyAdminPriviledgeOfSameGym,
    upload.single("image"),
    uploadImageToS3,
    trainerController.addTrainer
);

router.put(
    "/:staffId",
    verifyEmployeeOrAdminOfSameGym,
    trainerController.updateTrainer
);

module.exports = router;
