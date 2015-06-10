#/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/meals.json -d '{"meal": {"date_and_time_of_meal":"2016-04-14 22:52:52.758612", "deadline":"2016-04-13"}}'
curl -i -H "Content-Type: application/json" -X POST localhost:3000/meals.json -d '{"meal": {"date_and_time_of_meal":"2015-05-14 22:52:52.758612", "deadline":"2015-04-13"}}'
