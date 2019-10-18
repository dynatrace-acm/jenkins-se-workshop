#!/bin/bash
echo "Load Test Launched"  >> ./loadtest.log
while [ ! -f ./endloadtest.txt ];
do
    curl -s "http://localhost/" -H "x-dynatrace-test: NA=Test.Homepage;" -o nul &> loadtest.log
    curl -s "http://localhost/version" -H "x-dynatrace-test: NA=Test.Version;" -o nul &> loadtest.log
    curl -s "http://localhost/api/echo?text=This is from a testing script" -H "x-dynatrace-test: NA=Test.Echo;" -o nul &> loadtest.log
    curl -s "http://localhost/api/invoke?url=http://www.dynatrace.com" -H "x-dynatrace-test: NA=Test.Invoke;" -o nul &> loadtest.log

    sleep 2
done;
exit 0
