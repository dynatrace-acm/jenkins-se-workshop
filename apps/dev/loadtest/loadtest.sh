#!/bin/bash
echo "Load Test Launched"  >> ./loadtest.log
while [ ! -f ./endloadtest.txt ];
do

    curl -s "http://localhost:3000/" -o nul &> loadtest.log
    curl -s "http://localhost:3000/version" -o nul &> loadtest.log
    curl -s "http://localhost:3000/api/echo?text=This is from a production user" -o nul &> loadtest.log
    curl -s "http://localhost:3000/api/invoke?url=http://www.dynatrace.com" -o nul &> loadtest.log
    curl -s "http://localhost:3000/api/invoke?url=http://blog.dynatrace.com" -o nul &> loadtest.log

    sleep 2
done;
exit 0
