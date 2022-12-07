const express = require("express");

const dietPlanController = require("../controllers/dietPlan");

const router = express.Router();

router.get("/", dietPlanController.getAllDietPlans);

router.post("/", dietPlanController.addDietPlan);

router.put("/:planId", dietPlanController.updateDietPlan);

router.delete("/:planId", dietPlanController.deleteDietPlan);

router.get("/:email", dietPlanController.getDietPlanForUser);

module.exports = router;
