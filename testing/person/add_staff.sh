#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/staff.json -d '{"person": {"name":"test person 1", "username":"testii", "password":"pass1"}}'

