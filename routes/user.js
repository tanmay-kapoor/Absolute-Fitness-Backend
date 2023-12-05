const express = require("express");

const userController = require("../controllers/user");
const {
    verifyAdminPriviledge,
    verifyToken,
    verifyMember,
    verifyRootPriviledge,
} = require("../util/middlewares/authentication.js");

const router = express.Router();

router.get("/", verifyRootPriviledge, userController.getAllUsers);

router.get("/:email", verifyToken, userController.getUser);

router.post("/signup", userController.addUser);

router.put("/:email", verifyMember, userController.updateUser);

router.delete("/:email", verifyToken, userController.deleteUser);

module.exports = router;
