const express = require("express");

const authenticationController = require("../controllers/authentication");

const router = express.Router();

router.post("/login", authenticationController.authenticate);

router.post("/resetPassword", authenticationController.generateResetToken);

router.post("/resetPassword/:token", authenticationController.resetPassword);

module.exports = router;
