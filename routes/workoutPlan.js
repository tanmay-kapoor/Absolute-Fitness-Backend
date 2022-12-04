const express = require("express");

const workoutPlanController = require("../controllers/workoutPlan");

const router = express.Router();

router.get("/", workoutPlanController.getAllWorkoutPlans);

router.post("/", workoutPlanController.addWorkoutPlan);

router.put("/:planId", workoutPlanController.updateWorkoutPlan);

router.delete("/:planId", workoutPlanController.deleteWorkoutPlan);

module.exports = router;
