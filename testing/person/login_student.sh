#!/bin/bash

curl -i -H "Content-Type: application/json" -X GET localhost:3000/student/login.json -d '{"username":"testiiStudent", "password":"password2Alpha"}'
