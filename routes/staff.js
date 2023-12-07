const express = require("express");

const staffController = require("../controllers/staff");
const {
    verifyEmployee,
    verifyAdminPriviledge,
    verifyRootPriviledge,
    verifyAdminPriviledgeOfSameGym,
    verifyRootOrEmployeeOrAdminOfSameGym,
    verifyRootOrAdminPriviledgeOfSameGym,
} = require("../util/middlewares/authentication");

const router = express.Router();

router.get("/", verifyRootPriviledge, staffController.getAllStaff);

router.get(
    "/:staffId",
    verifyRootOrEmployeeOrAdminOfSameGym,
    staffController.getStaff
);

router.post(
    "/signup",
    verifyRootOrAdminPriviledgeOfSameGym,
    staffController.addStaff
);

router.put(
    "/:staffId",
    verifyRootOrEmployeeOrAdminOfSameGym,
    staffController.updateStaff
);

router.delete(
    "/:staffId",
    verifyRootOrEmployeeOrAdminOfSameGym,
    staffController.deleteStaff
);

module.exports = router;
