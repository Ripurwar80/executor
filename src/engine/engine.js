const { execFile } = require('child_process');
const {csv} = require('csvtojson')
const startExecution = (req,res) => {
    try{
        execFile('./engine/executor.sh',(error, stdout, stderr) => {
            if (error) {
                console.error(`exec error: ${error}`);
                res.send({status: "FAILED", data: "execution failed"});
                return
            }
            res.send({status: "OK", data: "execution has been Completed"});
            console.log(`stdout: ${stdout}`);
            console.error(`stderr: ${stderr}`);

        });
    } catch (error){
        res.status(error?.status || 500).send({status: "FAILED", data: {error: error?.message || error}})
    }

}

const getResult = (req,res) => {
    try{
        csv()
            .fromFile("./stats1.csv")
            .then((jsonObj) => {
                res.status(200).send({ status: "OK", data: jsonObj });
            });
    } catch (error){
        res.status(error?.status || 500)
            .send({status: "FAILED", data: {error: error?.message || error}});
    }

}

module.exports = {
    startExecution,
    getResult
}
