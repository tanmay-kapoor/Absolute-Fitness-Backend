const db = require("../util/database");

module.exports = class Trainer {
    static getTrainer(staffId) {
        return db.execute("SELECT * FROM trainers WHERE staff_id = ?", [
            staffId,
        ]);
    }

    static getAllTrainersForGym(gymId) {
        const query =
            "SELECT name, speciality, s.staff_id, years_of_exp, t.image_url, description, g.gym_id FROM " +
            "(staff s JOIN trainers t " +
            "ON s.staff_id = t.staff_id) " +
            "JOIN gyms g " +
            "ON s.gym_id = g.gym_id " +
            "HAVING g.gym_id = ?";

        return db.execute(query, [gymId]);
    }

    static getAllUserHealthRecordsForTrainer(trainerId) {
        console.log(trainerId);
        const query =
            "SELECT h.trainer_id, r.* FROM " +
            "health_plans h JOIN users u " +
            "ON h.email = u.email " +
            "JOIN health_records r " +
            "ON u.email = r.email " +
            "HAVING h.trainer_id = ? " +
            "ORDER BY r.date_calculated ASC";
        return db.execute(query, [trainerId]);
    }
};
