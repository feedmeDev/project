#!/bin/bash

#curl -i -H "Content-type: application/json" -X POST localhost:3000/attendances.json -d '{"meal_id":"1", "person_id":"1", "going":"true"}'
curl -i -H "Content-type: application/json" -X POST localhost:3000/attendances.json -d '{"meal_id":"1", "person_id":"1", "going":"true", "list": ["3","2","1"]}'
curl -i -H "Content-type: application/json" -X POST localhost:3000/attendances.json -d '{"meal_id":"1", "person_id":"2", "going":"true", "list": ["5","2","1"]}'
curl -i -H "Content-type: application/json" -X POST localhost:3000/attendances.json -d '{"meal_id":"1", "person_id":"3", "going":"false", "list": ["4"]}'
