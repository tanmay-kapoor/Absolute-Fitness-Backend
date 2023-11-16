const db = require("../util/database");
const { v4: uuidv4 } = require("uuid");
const moment = require("moment-timezone");

module.exports = class ResetToken {
    static deleteOldResetTokens(username) {
        return db.execute("CALL deleteOldResetTokens(?)", [username]);
    }

    static async addResetToken(details) {
        const { username, type } = details;
        await this.deleteOldResetTokens(username);
        const token = uuidv4();

        const expiry = moment
            .utc()
            .clone()
            .add(30, "minutes") // expiry time is 30 minutes
            .toISOString()
            .slice(0, 19)
            .replace("T", " "); // MYSQL compatible format

        db.execute("CALL addResetToken(?, ?, ?, ?)", [
            token,
            username,
            type,
            expiry,
        ]);
        return token;
    }

    static async isValidResetToken(details) {
        const { token, username } = details;
        const [[[res]]] = await db.execute("CALL getTokenExpiry(?, ?)", [
            token,
            username,
        ]);
        if (!res) {
            return false;
        }

        const expiry = moment.tz(res.expiry, "UTC");
        const currDate = moment.utc();

        if (expiry.isAfter(currDate)) {
            return true;
        }
        return false;
    }
};
