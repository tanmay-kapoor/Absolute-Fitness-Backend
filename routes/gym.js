const express = require("express");

const gymController = require("../controllers/gym");
const upload = require("../util/middlewares/fileUpload");
const uploadImagesToS3 = require("../util/middlewares/uploadImagesToS3.js");
const {
    verifyRootPriviledge,
    verifyRootOrAdminPriviledgeOfSameGym,
    verifyAdminPriviledge,
    verifyToken,
    verifyLoggedIn,
    verifyAdminPriviledgeOfSameGym,
} = require("../util/middlewares/authentication.js");

const router = express.Router();

router.get("/", gymController.getAllGyms);

router.get("/:gymId", gymController.getGym);

router.get("/:gymId/facilities", gymController.getAllFacilities);

router.get("/:gymId/equipments", gymController.getAllEquipmentsForGym);

router.get("/:gymId/trainers", gymController.getAllTrainers);

router.get(
    "/:gymId/members",
    verifyRootOrAdminPriviledgeOfSameGym,
    gymController.getAllUsers
);

router.get(
    "/:gymId/staff",
    verifyRootOrAdminPriviledgeOfSameGym,
    gymController.getAllStaff
);

router.post(
    "/",
    verifyRootPriviledge,
    upload.array("images"),
    uploadImagesToS3,
    gymController.addGym
);

router.post(
    "/:gymId/equipment",
    verifyRootOrAdminPriviledgeOfSameGym,
    upload.single("image"),
    uploadImagesToS3,
    gymController.addEquipmentForGym
);

router.put(
    "/:gymId/equipment/:equipmentId",
    verifyRootOrAdminPriviledgeOfSameGym,
    gymController.updateEquipmentForGym
);

router.delete(
    "/:gymId/equipment/:equipmentId",
    verifyRootOrAdminPriviledgeOfSameGym,
    gymController.deleteEquipmentForGym
);

router.put(
    "/:gymId",
    verifyRootOrAdminPriviledgeOfSameGym,
    gymController.updateGym
);

router.delete("/:gymId", verifyRootPriviledge, gymController.deleteGym);

module.exports = router;
