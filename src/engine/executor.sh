#!/bin/bash
pwd
curl -o execution1.yaml http://54.197.206.152:3001/api/v1/file/configuration.yaml
curl -o loadscenario.yaml http://54.197.206.152:3001/api/v1/file/load-scenario.yaml
bzt execution.yaml loadscenario.yaml
