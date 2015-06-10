#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/person.json -d '{"person": {"name":"test student 1", "username":"testiiStudent", "password":"pass1word", "password_confirmation":"pass1word", "staff":false}}'
curl -i -H "Content-Type: application/json" -X POST localhost:3000/person.json -d '{"person": {"name":"test student 2", "username":"testiiStudent2", "password":"pass1word", "password_confirmation":"pass1word", "staff":false}}'
curl -i -H "Content-Type: application/json" -X POST localhost:3000/person.json -d '{"person": {"name":"test student 3", "username":"testiiStudent3", "password":"pass1word", "password_confirmation":"pass1word", "staff":false}}'


