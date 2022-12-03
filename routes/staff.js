const express = require("express");

const staffController = require("../controllers/staff");

const router = express.Router();

router.get("/", staffController.getAllStaff);

router.get("/:staffId", staffController.getStaff);

router.post("/login", staffController.authenticate);

router.post("/signup", staffController.addStaff);

router.put("/:staffId", staffController.updateStaff);

router.delete("/:staffId", staffController.deleteStaff);

module.exports = router;
