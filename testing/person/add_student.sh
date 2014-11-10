#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/student.json -d '{"person": {"name":"test student 1", "username":"testiiStudent", "password":"pass1word"}}'


