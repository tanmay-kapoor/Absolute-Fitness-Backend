const express = require("express");

const workoutPlanController = require("../controllers/workoutPlan");
const {
    verifyMember,
    verifyEmployeeNotSpecific,
} = require("../util/middleware");

const router = express.Router();

router.get(
    "/",
    verifyEmployeeNotSpecific,
    workoutPlanController.getAllWorkoutPlans
);

router.post(
    "/",
    verifyEmployeeNotSpecific,
    workoutPlanController.addWorkoutPlan
);

router.put(
    "/:planId",
    verifyEmployeeNotSpecific,
    workoutPlanController.updateWorkoutPlan
);

router.delete(
    "/:planId",
    verifyEmployeeNotSpecific,
    workoutPlanController.deleteWorkoutPlan
);

router.get(
    "/:email",
    verifyMember,
    workoutPlanController.getWorkoutPlanForUser
);

module.exports = router;
