const express = require("express");

const equipmentController = require("../controllers/equipment");
const { verifyAdminPriviledge } = require("../util/middlewares/authentication");
const upload = require("../util/middlewares/fileUpload");
const uploadImagesToS3 = require("../util/middlewares/uploadImagesToS3");

const router = express.Router();

router.get("/", verifyAdminPriviledge, equipmentController.getAllEquipments);

router.get(
    "/:equipmentId",
    verifyAdminPriviledge,
    equipmentController.getEquipment
);

router.post(
    "/",
    verifyAdminPriviledge,
    upload.single("image"),
    uploadImagesToS3,
    equipmentController.addEquipment
);

router.put(
    "/:equipmentId",
    verifyAdminPriviledge,
    upload.single("image"),
    uploadImagesToS3,
    equipmentController.updateEquipment
);

router.delete(
    "/:equipmentId",
    verifyAdminPriviledge,
    equipmentController.deleteEquipment
);

module.exports = router;
