const db = require("../util/database");
const { v4: uuidv4 } = require("uuid");

module.exports = class Token {
    static deleteOldTokens(email) {
        return db.execute("CALL deleteOldTokens(?)", [email]);
    }

    static async addResetToken(email) {
        console.log(new Date().toISOString());
        await this.deleteOldTokens(email);

        const offset = 30 * 60000; // 30 minutes
        const token = uuidv4();

        const currDate = new Date();
        const expDate = new Date(currDate.getTime() + offset)
            .toISOString()
            .slice(0, 19)
            .replace("T", " "); // MYSQL compatible format

        return db.execute("CALL addResetToken(?, ?, ?)", [
            token,
            email,
            expDate,
        ]);
    }
};
