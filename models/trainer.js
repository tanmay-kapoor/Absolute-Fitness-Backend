import { execute } from "../util/database";

export default class Trainer {
    static getTrainer(staffId) {
        return execute("CALL getTrainer(?)", [staffId]);
    }

    static getAllTrainersForGym(gymId) {
        const query = "CALL getAllTrainersForGym(?)";
        return execute(query, [gymId]);
    }

    static getAllUserHealthRecordsForTrainer(trainerId) {
        const query = "CALL getAllUserHealthRecordsForTrainer(?)";
        return execute(query, [trainerId]);
    }
}
