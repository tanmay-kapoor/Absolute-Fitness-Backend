const express = require("express");

const healthRecordController = require("../controllers/healthRecord");
const {
    verifyToken,
    verifyMember,
    verifyAdminPriviledge,
    verifyMemberWithoutEmail,
    verifyLoggedIn,
} = require("../util/middlewares/authentication");

const router = express.Router();

router.get(
    "/",
    verifyAdminPriviledge,
    healthRecordController.getAllHealthRecords
);

router.get(
    "/withName",
    verifyAdminPriviledge,
    healthRecordController.getAllHealthRecordsWithName
);

router.post("/", verifyLoggedIn, healthRecordController.addHealthRecord);

router.put(
    "/:recordId",
    verifyMember,
    healthRecordController.updateHealthRecord
);

router.delete(
    "/:recordId",
    verifyMemberWithoutEmail,
    healthRecordController.deleteHealthRecord
);

router.get(
    "/:email",
    verifyLoggedIn,
    healthRecordController.getHealthRecordsForUser
);

module.exports = router;
