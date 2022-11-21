require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");

const userRoutes = require("./routes/user");
const gymRoutes = require("./routes/gym");
const healthRecordRoutes = require("./routes/healthRecord");

const app = express();

const port = process.env.PORT || 5002;

app.use(bodyParser.urlencoded({ extended: true }));

app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
    res.setHeader(
        "Access-Control-Allow-Headers",
        "Content-Type, Authorization"
    );
    next();
});

app.use("/user", userRoutes);
app.use("/gym", gymRoutes);
app.use("/healthRecord", healthRecordRoutes);

app.listen(port, () => console.log(`listening on port ${port}`));
