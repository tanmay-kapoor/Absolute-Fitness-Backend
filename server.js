require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

const userRoutes = require("./routes/user");
const gymRoutes = require("./routes/gym");
const healthRecordRoutes = require("./routes/healthRecord");
const staffRoutes = require("./routes/staff");

const app = express();

const port = process.env.PORT || 5002;

app.use(express.json()); //parsing http data
app.use(express.json({ limit: "30mb", extended: true }));
app.use(express.urlencoded({ limit: "30mb", extended: true }));
app.use(cors());

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
app.use("/staff", staffRoutes);

app.listen(port, () => console.log(`listening on port ${port}`));
