const db = require("../util/database");

module.exports = class Token {
    static deleteOldTokens(email) {
        return execute("CALL deleteOldTokens(?)", [email]);
    }

    static async addResetToken(email) {
        await deleteOldTokens(email);

        const offset = 30 * 60000; // 30 minutes
        const token = uuidv4();

        const currDate = new Date();
        const expDate = new Date(currDate.getTime() + offset)
            .toISOString()
            .slice(0, 19)
            .replace("T", " "); // MYSQL compatible format

        return execute("CALL addResetToken(?, ?, ?)", [token, email, expDate]);
    }
};
