#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST https://localhost/login/staff.json -d '{"username": "testii", "password": "pass1word"}'
