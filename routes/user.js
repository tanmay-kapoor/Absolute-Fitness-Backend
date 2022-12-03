const express = require("express");

const userController = require("../controllers/user");

const router = express.Router();

router.get("/", userController.getAllUsers);

router.get("/:email", userController.getUser);

router.post("/login", userController.authenticate);

router.post("/signup", userController.addUser);

router.put("/:email", userController.updateUser);

router.delete("/:email", userController.deleteUser);

router.get("/:email/healthRecords", userController.getHealthRecordsForUser);

module.exports = router;
