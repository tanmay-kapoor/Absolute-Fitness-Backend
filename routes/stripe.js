const express = require("express");

const stripeController = require("../controllers/stripe");

const router = express.Router();

router.get("/products", stripeController.getAllProducts);

router.get("/prices", stripeController.getAllPrices);

router.get("/gym-membership-pricing", stripeController.getGymMembershipPricing);

router.post("/create-subscription", stripeController.createSubscription);

module.exports = router;
