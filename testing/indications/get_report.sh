#!/bin/bash

echo "---------------------------------------"
echo "----------------Report-----------------"
echo "---------------------------------------"

curl -i -H "Content-type: application/json" -X GET localhost:3000/get_report/1.json
