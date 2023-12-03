const express = require("express");

const adminController = require("../controllers/admin");
const {
    verifyRootPriviledge,
} = require("../util/middlewares/authentication.js");

const router = express.Router();

router.get("/", verifyRootPriviledge, adminController.getAllAdmins);

router.get("/:staffId", verifyRootPriviledge, adminController.getAdmin);

router.get(
    "/:gymId/admins",
    verifyRootPriviledge,
    adminController.getAllAdminsForGym
);

router.post("/", verifyRootPriviledge, adminController.addAdminForGym);

// router.put("/:staffId", verifyRootPriviledge, adminController.updateAdmin);

// router.delete("/:staffId", verifyRootPriviledge, adminController.deleteAdmin);

module.exports = router;
