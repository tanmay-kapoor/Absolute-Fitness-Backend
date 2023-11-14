const express = require("express");

const userController = require("../controllers/user");
const {
    verifyAdminPriviledge,
    verifyToken,
    verifyMember,
} = require("../util/middleware.js");

const router = express.Router();

router.get("/", verifyAdminPriviledge, userController.getAllUsers);

router.get("/:email", verifyToken, userController.getUser);

router.post("/login", userController.authenticate);

router.post("/signup", userController.addUser);

router.post("/resetPassword", userController.resetPassword);

router.put("/:email", verifyMember, userController.updateUser);

router.delete("/:email", verifyToken, userController.deleteUser);

module.exports = router;
