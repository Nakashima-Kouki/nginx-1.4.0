#!/bin/bash
docker build -t nginx_vuln_1.4.0 . > docker_build.log 2>&1
echo "EXIT_CODE=$?" >> docker_build.log
