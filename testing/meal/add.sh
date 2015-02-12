#/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/meals.json -d '{"meal": {"date_and_time_of_meal":"2011-04-14 22:52:52.758612", "deadline":"2011-04-15"}}'
curl -i -H "Content-Type: application/json" -X POST localhost:3000/meals.json -d '{"meal": {"date_and_time_of_meal":"2011-04-15 22:52:52.758612", "deadline":"2011-04-16"}}'
