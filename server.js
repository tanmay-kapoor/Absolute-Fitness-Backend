import "dotenv/config";
import express, { json, urlencoded } from "express";
import cors from "cors";

//Internal API
import userRoutes from "./routes/user";
import gymRoutes from "./routes/gym";
import healthRecordRoutes from "./routes/healthRecord";
import staffRoutes from "./routes/staff";
import dietPlanRoutes from "./routes/dietPlan";
import workoutPlanRoutes from "./routes/workoutPlan";
import healthPlanRoutes from "./routes/healthPlan";
import trainerRoutes from "./routes/trainer";

//3rd Party API
import stripeRoutes from "./routes/stripe";

const app = express();

const port = process.env.PORT || 5001;

app.use(json()); //parsing http data
app.use(json({ limit: "30mb", extended: true }));
app.use(urlencoded({ limit: "30mb", extended: true }));
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
app.use("/dietPlan", dietPlanRoutes);
app.use("/workoutPlan", workoutPlanRoutes);
app.use("/healthPlan", healthPlanRoutes);
app.use("/trainer", trainerRoutes);

app.use("/stripe", stripeRoutes);

app.listen(port, () => console.log(`listening on port ${port}`));
