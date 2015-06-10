#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/person.json -d '{"person": {"name":"test person 1", "username":"testii", "password":"pass1word", "password_confirmation":"pass1word", "staff":true}}'

