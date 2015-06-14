#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST http://localhost/login/staff.json -d '{"username": "feedmeAdmin", "password": "Adm1nPassword"}'
