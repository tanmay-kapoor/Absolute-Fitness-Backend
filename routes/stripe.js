const express = require("express");

const stripeController = require("../controllers/stripe");
const {
    verifyMemberWithoutEmail,
} = require("../util/middlewares/authentication");

const router = express.Router();

router.get(
    "/products",
    verifyMemberWithoutEmail,
    stripeController.getAllProducts
);

router.get("/prices", verifyMemberWithoutEmail, stripeController.getAllPrices);

router.get(
    "/gym-membership-pricing",
    verifyMemberWithoutEmail,
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
