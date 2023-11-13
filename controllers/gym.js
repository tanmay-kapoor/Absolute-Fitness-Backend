import {
    getAllGyms,
    getGym,
    addGym,
    updateGym,
    deleteGym,
} from "../models/gym";
import { getAllTrainersForGym, getTrainer } from "../models/trainer";
import {
    getAllEquipmentsForGym,
    updateEquipmentForGym,
} from "../models/equipment";
import { getAllFacilitiesForGym } from "../models/facility";
import { getAllUsersForGym, getAllStaffForGym } from "../models/user";
import { getAdmin } from "../models/admin";

export async function getAllGyms(req, res) {
    try {
        const [[allGyms]] = await getAllGyms();
        res.status(200).json(allGyms);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getGym(req, res) {
    try {
        const gymId = req.params["gymId"];
        const [[gym]] = await getGym(gymId);

        if (gym.length === 0) {
            res.status(401).json({ msg: "Does not exist" });
        } else {
            res.json(gym[0]);
        }
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function addGym(req, res) {
    try {
        const details = {
            imageUrl: req.body.imageUrl,
            phone: req.body.phone,
            location: req.body.location,
            membershipFee: req.body.membershipFee,
        };
        await addGym(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function updateGym(req, res) {
    try {
        const details = {
            gymId: req.params["gymId"],
            imageUrl: req.body.imageUrl,
            phone: req.body.phone,
            location: req.body.location,
            membershipFee: req.body.membershipFee,
        };
        await updateGym(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function deleteGym(req, res) {
    try {
        const gymId = req.params["gymId"];
        await deleteGym(gymId);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getAllFacilities(req, res) {
    try {
        const gymId = req.params["gymId"];
        const [[allFacilities]] = await getAllFacilitiesForGym(gymId);
        res.status(200).json(allFacilities);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getAllEquipments(req, res) {
    try {
        const gymId = req.params["gymId"];
        const [[allEquipments]] = await getAllEquipmentsForGym(gymId);
        res.status(200).json(allEquipments);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getAllTrainers(req, res) {
    try {
        const gymId = req.params["gymId"];
        const [[allTrainers]] = await getAllTrainersForGym(gymId);
        allTrainers.map((trainer) => delete trainer["password"]);
        res.status(200).json(allTrainers);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getAllUsers(req, res) {
    try {
        const gymId = req.params["gymId"];
        const [[allUsers]] = await getAllUsersForGym(gymId);
        allUsers.map((user) => {
            delete user["password"];
            delete user["gym_id"];
        });
        res.status(200).json(allUsers);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function getAllStaff(req, res) {
    try {
        const gymId = req.params["gymId"];
        let [[allStaff]] = await getAllStaffForGym(gymId);
        allStaff = await attachStaffType(allStaff);
        res.status(200).json(allStaff);
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

export async function updateEquipmentForGym(req, res) {
    try {
        const details = {
            gymId: req.params["gymId"],
            equipmentId: req.params["equipmentId"],
            quantity: req.body.quantity,
            lastServiced: req.body.last_serviced,
        };
        await updateEquipmentForGym(details);
        res.status(200).json({ msg: "Success" });
    } catch (err) {
        res.status(500).json({ msg: err.message });
    }
}

const attachStaffType = (allStaff) => {
    const promises = allStaff.map(async (staff) => {
        delete staff["password"];
        delete staff["gym_id"];
        staff["type"] = await getStaffType(staff["staff_id"]);
        return staff;
    });
    return Promise.all(promises);
};

const getStaffType = async (staffId) => {
    let [[details]] = await getTrainer(staffId);

    if (details.length != 0) {
        return "trainer";
    } else {
        [[details]] = await getAdmin(staffId);
        if (details.length != 0) {
            return "admin";
        }
        return "staff";
    }
};
