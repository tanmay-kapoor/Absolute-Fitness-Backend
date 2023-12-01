const db = require("../util/database");
const ResetToken = require("./resetToken");

module.exports = class UnionStuff {
    static findEntry(username) {
        return db.execute("CALL getEntryForLogin(?)", [username]);
    }

    static async resetPassword(details) {
        const { token, exp } = details;
        const isValidResetToken = await ResetToken.isValidResetToken({
            token,
            exp,
        });
        if (!isValidResetToken) {
            throw new Error("Invalid token");
        }

        const { username, password, type } = details;
        return db.execute("CALL resetPassword(?, ?, ?)", [
            username,
            password,
            type,
        ]);
    }
};
