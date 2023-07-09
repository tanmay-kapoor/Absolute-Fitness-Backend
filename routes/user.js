const express = require("express");

const userController = require("../controllers/user");
const { verifyAdminPriviledge, verifyToken } = require("../util/middleware.js");

const router = express.Router();

router.get("/", verifyAdminPriviledge, userController.getAllUsers);

router.get("/:email", verifyToken, userController.getUser);

router.post("/login", userController.authenticate);

router.post("/signup", userController.addUser);

router.put("/:email", verifyToken, userController.updateUser);

router.delete("/:email", verifyToken, userController.deleteUser);

module.exports = router;
