const db = require("../util/database");

module.exports = class UnionStuff {
    static findUser(username) {
        return db.execute("CALL getEntryForLogin(?)", [username]);
    }
};
