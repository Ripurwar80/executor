#!/bin/bash
pwd
curl -o execution1.yaml http://35.86.80.21:3001/api/v1/file/configuration.yaml
curl -o loadscenario.yaml http://35.86.80.21:3001/api/v1/file/load-scenario.yaml
java -version
javac -version
bzt execution.yaml loadscenario.yaml
