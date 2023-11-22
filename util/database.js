const mysql = require("mysql2");
const { DB_HOST, DB_USER, DATABASE, PASSWORD } = require("./constants");

const pool = mysql.createPool({
    host: DB_HOST,
    user: DB_USER,
    database: DATABASE,
    password: PASSWORD,
    dateStrings: ["DATE", "DATETIME"],
});

module.exports = pool.promise();
