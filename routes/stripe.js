import { Router } from "express";

import {
    getAllProducts,
    getAllPrices,
    getGymMembershipPricing,
    createSubscription,
} from "../controllers/stripe";

const router = Router();

router.get("/products", getAllProducts);

router.get("/prices", getAllPrices);

router.get("/gym-membership-pricing", getGymMembershipPricing);

router.post("/create-subscription", createSubscription);

export default router;
