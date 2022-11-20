const express = require("express");

const authenticationController = require("../controllers/authentication");

const router = express.Router();

router.get("/", authenticationController.getAllUsers);

router.get("/:email", authenticationController.getUser);

router.post("/login", authenticationController.authenticate);

router.post("/signup", authenticationController.addUser);

router.put("/:email", authenticationController.updateUser);

router.delete("/:email", authenticationController.deleteUser);

module.exports = router;
