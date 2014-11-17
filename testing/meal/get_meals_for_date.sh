#!/bin/bash

curl -i -H "Content-Type: application/json" -X GET localhost:3000/meals.json -d '{"date":"2011-04-14 22:52:52.758612"}'
