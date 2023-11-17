const express = require("express");

const gymController = require("../controllers/gym");
const upload = require("../util/middlewares/fileUpload");
const uploadImageToS3 = require("../util/middlewares/uploadImageToS3");
const {
    verifyAdminPriviledge,
    verifyToken,
    verifyLoggedIn,
    verifyAdminPriviledgeOfSameGym,
} = require("../util/middlewares/authentication.js");

const router = express.Router();

router.get("/", gymController.getAllGyms);

router.get("/:gymId", verifyLoggedIn, gymController.getGym);

router.get("/:gymId/facilities", gymController.getAllFacilities);

router.get("/:gymId/equipments", gymController.getAllEquipments);

router.get("/:gymId/trainers", gymController.getAllTrainers);

router.get("/:gymId/members", verifyAdminPriviledge, gymController.getAllUsers);

router.get("/:gymId/staff", verifyAdminPriviledge, gymController.getAllStaff);

router.post("/", verifyAdminPriviledge, gymController.addGym);

router.post(
    "/:gymId/equipment",
    verifyAdminPriviledgeOfSameGym,
    upload.single("image"),
    uploadImageToS3,
    gymController.addEquipmentForGym
);

router.put(
    "/:gymId/equipment/:equipmentId",
    verifyAdminPriviledgeOfSameGym,
    gymController.updateEquipmentForGym
);

router.delete(
    "/:gymId/equipment/:equipmentId",
    verifyAdminPriviledgeOfSameGym,
    gymController.deleteEquipmentForGym
);

router.put("/:gymId", verifyAdminPriviledge, gymController.updateGym);

router.delete("/:gymId", verifyAdminPriviledge, gymController.deleteGym);

module.exports = router;
