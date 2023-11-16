const db = require("../util/database");
const ResetToken = require("./resetToken");

module.exports = class UnionStuff {
    static findEntry(username) {
        return db.execute("CALL getEntryForLogin(?)", [username]);
    }

    static resetPassword(details) {
        const { username, token, password } = details;

        if (!ResetToken.isValidResetToken({ username, token })) {
            throw new Error("Invalid token");
        }

        return db.execute("CALL resetPassword(?, ?)", [username, password]);
    }
};
