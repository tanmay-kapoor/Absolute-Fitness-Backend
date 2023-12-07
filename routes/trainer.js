const trainerController = require("../controllers/trainer");
const upload = require("../util/middlewares/fileUpload");
const uploadImagesToS3 = require("../util/middlewares/uploadImagesToS3");
const {
    verifyLoggedIn,
    verifyAdminPriviledgeOfSameGym,
    verifyRootOrEmployeeOrAdminOfSameGym,
    verifyEmployee,
} = require("../util/middlewares/authentication");

const express = require("express");
const router = express.Router();

router.get(
    "/:staffId/memberRecords",
    verifyLoggedIn,
    trainerController.getAllUserHealthRecordsForTrainer
);

router.get(
    "/:staffId",
    verifyRootOrEmployeeOrAdminOfSameGym,
    trainerController.getTrainer
);

router.post(
    "/",
    verifyAdminPriviledgeOfSameGym,
    upload.single("image"),
    uploadImagesToS3,
    trainerController.addTrainer
);

router.put(
    "/:staffId",
    verifyRootOrEmployeeOrAdminOfSameGym,
    trainerController.updateTrainer
);

module.exports = router;
