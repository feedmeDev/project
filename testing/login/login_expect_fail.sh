#!/bin/bash

curl -i -H "Content-Type: application/json" -X GET localhost:3000/staff/login.json -d '{"username": "testii", "password": "FailPassword"}'
