const express = require("express");

const dietPlanController = require("../controllers/dietPlan");
const { verifyAdminPriviledge, verifyToken } = require("../util/middleware");

const router = express.Router();

router.get("/", verifyAdminPriviledge, dietPlanController.getAllDietPlans);

router.post("/", verifyAdminPriviledge, dietPlanController.addDietPlan);

router.put(
    "/:planId",
    verifyAdminPriviledge,
    dietPlanController.updateDietPlan
);

router.delete(
    "/:planId",
    verifyAdminPriviledge,
    dietPlanController.deleteDietPlan
);

router.get("/:email", verifyToken, dietPlanController.getDietPlanForUser);

module.exports = router;
