import { execute } from "../util/database";

export default class Admin {
    static getAdmin(staffId) {
        const query = "CALL getAdmin(?)";
        return execute(query, [staffId]);
    }
}
