const express = require("express");

const userController = require("../controllers/user");
const {
    verifyAdminPriviledge,
    verifyToken,
    verifyMember,
    validateConsistentUsernameInTokens,
    verifyRootPriviledge,
    verifyRootOrAdminPriviledge,
} = require("../util/middlewares/authentication.js");

const router = express.Router();

router.get("/", verifyRootOrAdminPriviledge, userController.getAllUsers);

router.get("/:email", verifyToken, userController.getUser);

router.post("/signup", userController.addUser);

router.post(
    "/payment",
    validateConsistentUsernameInTokens,
    userController.promoteToPayingCustomer
);

router.put("/:email", verifyMember, userController.updateUser);

router.delete("/:email", verifyToken, userController.deleteUser);

module.exports = router;
