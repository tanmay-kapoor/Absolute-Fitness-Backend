const express = require("express");

const healthRecordController = require("../controllers/healthRecord");

const router = express.Router();

router.get("/", healthRecordController.getAllHealthRecords);

router.get("/withName", healthRecordController.getAllHealthRecordsWithName);

router.post("/", healthRecordController.addHealthRecord);

router.put("/:recordId", healthRecordController.updateHealthRecord);

router.delete("/:recordId", healthRecordController.deleteHealthRecord);

router.get("/:email", healthRecordController.getHealthRecordsForUser);

module.exports = router;
