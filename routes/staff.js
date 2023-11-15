const express = require("express");

const staffController = require("../controllers/staff");
const { verifyEmployee, verifyAdminPriviledge } = require("../util/middleware");

const router = express.Router();

router.get("/", verifyAdminPriviledge, staffController.getAllStaff);

router.get("/:staffId", verifyEmployee, staffController.getStaff);

router.post("/signup", verifyAdminPriviledge, staffController.addStaff);

router.put("/:staffId", verifyEmployee, staffController.updateStaff);

router.delete("/:staffId", verifyEmployee, staffController.deleteStaff);

module.exports = router;
