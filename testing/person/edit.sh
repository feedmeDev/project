#!/bin/bash

curl -i -H "Content-Type: application/json" -X PUT localhost:3000/people/2.json -d '{"person": {"name": "test user 2", "password":"password2Alpha"}}'
