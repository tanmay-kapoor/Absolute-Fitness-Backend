const express = require("express");

const healthRecordController = require("../controllers/healthRecord");

const router = express.Router();

router.get("/", healthRecordController.getAllHealthRecords);

router.get("/withName", healthRecordController.getAllHealthRecordsWithName);

router.get("/:recordId", healthRecordController.getHealthRecord);

router.post("/", healthRecordController.addHealthRecord);

router.put("/:recordId", healthRecordController.updateHealthRecord);

router.delete("/:recordId", healthRecordController.deleteHealthRecord);

module.exports = router;
