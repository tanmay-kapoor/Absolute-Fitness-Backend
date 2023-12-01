const db = require("../util/database");
const { v4: uuidv4 } = require("uuid");
const moment = require("moment-timezone");
const helpers = require("../util/helpers");

module.exports = class ResetToken {
    static deleteOldResetTokens(username) {
        return db.execute("CALL deleteOldResetTokens(?)", [username]);
    }

    static async addResetToken(details) {
        const { username, type } = details;
        await this.deleteOldResetTokens(username);
        const token = helpers.generateResetToken({ username, type });

        db.execute("CALL addResetToken(?, ?)", [token, username]);
        return token;
    }

    static async isValidResetToken({ token, exp }) {
        const expiry = moment.unix(exp).tz("UTC");
        const currDate = moment.utc();

        if (expiry.isBefore(currDate)) return false;

        const [[[record]]] = await db.execute("CALL getResetToken(?)", [token]);
        if (!record) return false;

        return true;
    }
};
