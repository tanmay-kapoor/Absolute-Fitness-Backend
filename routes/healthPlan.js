const express = require("express");

const healthPlanController = require("../controllers/healthPlan");
const { verifyMember } = require("../util/middleware.js");

const router = express.Router();

router.get("/:email", verifyMember, healthPlanController.getHealthPlanForUser);

module.exports = router;
