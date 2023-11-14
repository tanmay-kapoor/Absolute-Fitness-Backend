const db = require("../util/database");
const { v4: uuidv4 } = require("uuid");
const moment = require("moment-timezone");

module.exports = class ResetToken {
    static deleteOldResetTokens(email) {
        return db.execute("CALL deleteOldResetTokens(?)", [email]);
    }

    static async addResetToken(email) {
        await this.deleteOldResetTokens(email);
        const token = uuidv4();

        const expiry = moment
            .utc()
            .clone()
            .add(30, "minutes") // expiry time is 30 minutes
            .toISOString()
            .slice(0, 19)
            .replace("T", " "); // MYSQL compatible format

        db.execute("CALL addResetToken(?, ?, ?)", [token, email, expiry]);
        return token;
    }

    static async isValidToken(details) {
        const { token, email } = details;
        const [[[res]]] = await db.execute("CALL getTokenExpiry(?, ?)", [
            token,
            email,
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
