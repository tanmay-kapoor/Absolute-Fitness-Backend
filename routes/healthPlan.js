const express = require("express");

const healthPlanController = require("../controllers/healthPlan");

const router = express.Router();

router.get("/:email", healthPlanController.getHealthPlanForUser);

module.exports = router;
