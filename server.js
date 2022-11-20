require("dotenv").config();

const express = require("express");

const bodyParser = require("body-parser");

const routes = require("./routes/routes");

const app = express();

const port = process.env.PORT || 3000;

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

app.use("/", routes);

app.listen(port, () => console.log(`listening on port ${port}`));
