#!/bin/bash
pwd
curl -o execution.yaml http://localhost:3001/api/v1/file/configuration.yaml
curl -o loadscenario.yaml http://localhost:3001/api/v1/file/load-scenario.yaml
java -version
javac -version
bzt execution.yaml loadscenario.yaml
