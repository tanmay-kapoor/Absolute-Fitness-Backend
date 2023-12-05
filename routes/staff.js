const express = require("express");

const staffController = require("../controllers/staff");
const {
    verifyEmployee,
    verifyAdminPriviledge,
    verifyEmployeeOrAdminOfSameGym,
    verifyAdminPriviledgeOfSameGym,
} = require("../util/middlewares/authentication");

const router = express.Router();

router.get("/", verifyAdminPriviledgeOfSameGym, staffController.getAllStaff);

router.get(
    "/:staffId",
    verifyEmployeeOrAdminOfSameGym,
    staffController.getStaff
);

router.post(
    "/signup",
    verifyAdminPriviledgeOfSameGym,
    staffController.addStaff
);

router.put(
    "/:staffId",
    verifyEmployeeOrAdminOfSameGym,
    staffController.updateStaff
);

router.delete(
    "/:staffId",
    verifyEmployeeOrAdminOfSameGym,
    staffController.deleteStaff
);

module.exports = router;
