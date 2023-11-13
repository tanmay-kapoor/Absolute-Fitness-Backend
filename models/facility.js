import { execute } from "../util/database";

export default class Facility {
    static getAllFacilitiesForGym(gymId) {
        return execute("CALL getAllFacilitiesForGym(?)", [gymId]);
    }
}
