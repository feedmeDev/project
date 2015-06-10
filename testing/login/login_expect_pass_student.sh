#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/login/customer.json -d '{"username": "testiiStudent", "password": "pass1word"}'
