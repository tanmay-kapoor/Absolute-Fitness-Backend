const Equipment = require("../models/equipment");

exports.getAllEquipments = async (req, res) => {
    try {
        const [[allEquipments]] = await Equipment.getAllEquipments();
        res.status(200).json(allEquipments);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.getEquipment = async (req, res) => {
    try {
        const [[[equipment]]] = await Equipment.getEquipment(
            req.params["equipmentId"]
        );
        res.status(200).json(equipment);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.addEquipment = async (req, res) => {
    try {
        const { name, image_url } = req.body;
        const [[result]] = await Equipment.addEquipment({
            name,
            imageUrl: image_url,
        });
        const [[[newEquipment]]] = await Equipment.getEquipment(
            result.equipment_id
        );
        res.status(200).json(newEquipment);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.updateEquipment = async (req, res) => {
    try {
        const { name, image_url } = req.body;
        const equipmentId = req.params["equipmentId"];
        await Equipment.updateEquipment({
            equipmentId,
            name,
            image_url,
        });
        const [[[updatedEquipment]]] = await Equipment.getEquipment(
            equipmentId
        );
        res.status(200).json(updatedEquipment);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};

exports.deleteEquipment = async (req, res) => {
    try {
        const equipmentId = req.params["equipmentId"];
        await Equipment.deleteEquipment(equipmentId);
        res.status(200).json({ msg: "Deleted successfully" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
};
