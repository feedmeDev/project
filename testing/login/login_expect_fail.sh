#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/login/staff.json -d '{"username": "testii", "password": "FailPassword"}'
curl -i -H "Content-Type: application/json" -X POST localhost:3000/login/customer.json -d '{"username": "testiiStudne", "password": "FailPassword"}'
