const express = require("express");
const bodyParser = require("body-parser")
const cors = require("cors")
const app = express();
const executorRouter = require("./routes/executorRoutes")

const PORT = 3001;

app.use(bodyParser.json());
app.use("/api/v1/executor", executorRouter);
app.use(cors());

app.listen(PORT,()=>{
    console.log("wapt executor server is running");
})