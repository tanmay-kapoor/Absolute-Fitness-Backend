const express = require("express");

const stripeController = require("../controllers/stripe");
const { verifyLoggedIn } = require("../util/middlewares/authentication");

const router = express.Router();

router.get("/products", verifyLoggedIn, stripeController.getAllProducts);

router.get("/prices", verifyLoggedIn, stripeController.getAllPrices);

router.get(
    "/gym-membership-pricing",
    verifyLoggedIn,
    stripeController.getGymMembershipPricing
);

// router.post(
//     "/create-subscription",
//     verifyMemberWithoutEmail,
//     stripeController.createSubscription
// );

router.post(
    "/create-checkout-session/:priceId",
    stripeController.createCheckoutSession
);

module.exports = router;
