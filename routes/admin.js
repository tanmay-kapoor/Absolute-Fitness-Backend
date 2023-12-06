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

// promotes staff to admin (update staff type to admin in mysql)
router.post("/", verifyRootPriviledge, adminController.createNewAdminForGym);

router.patch(
    "/:staffId",
    verifyRootPriviledge,
    adminController.promoteStaffTOAdmin
);

// TODO: add a staff of type admin to gym

// router.put("/:staffId", verifyRootPriviledge, adminController.updateAdmin);

// router.delete("/:staffId", verifyRootPriviledge, adminController.deleteAdmin);

module.exports = router;
