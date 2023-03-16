const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");

dotenv.config();

const app = express();
const port = process.env.PORT || 8080;

const connectDB = async () => {
    try {
        await mongoose.connect(
            process.env.MONGO_URI || "mongodb://localhost:27017/docker-node-app"
        );
        console.log("MongoDB connected");
    } catch (error) {
        console.error(error);
    }
};

connectDB();

app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
});
