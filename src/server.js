const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");

dotenv.config();

const app = express();
const port = process.env.PORT || 8080;

mongoose.connect(
    process.env.MONGODB_URI || "mongodb://localhost/docker-node-app",
    {
        useNewUrlParser: true,
        useUnifiedTopology: true,
        useCreateIndex: true,
        useFindAndModify: false,
    }
);

app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
});
