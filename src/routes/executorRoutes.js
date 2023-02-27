const express = require("express");
const router = express.Router();

const executorEngine = require("../engine/engine")

router.post("/execute",executorEngine.startExecution)
router.get("/result", executorEngine.getResult)

module.exports = router;
