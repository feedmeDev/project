#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/components.json -d '{"component": {"name":"food1", "description":"food description 1"}}'

curl -i -H "Content-Type: application/json" -X POST localhost:3000/components.json -d '{"component": {"name":"food2", "description":"food description 2"}}'

curl -i -H "Content-Type: application/json" -X POST localhost:3000/components.json -d '{"component": {"name":"food3", "description":"food description 3"}}'

curl -i -H "Content-Type: application/json" -X POST localhost:3000/components.json -d '{"component": {"name":"food4", "description":"food description 4"}}'

curl -i -H "Content-Type: application/json" -X POST localhost:3000/components.json -d '{"component": {"name":"food5", "description":"food description 5"}}'

curl -i -H "Content-Type: application/json" -X POST localhost:3000/components.json -d '{"component": {"name":"food6", "description":"food description 6"}}'
