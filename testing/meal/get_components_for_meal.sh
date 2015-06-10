#!/bin/bash

curl -i -H "Content-Type: application/json" -X GET localhost:3000/meal/components.json -d '{"meal": "1"}'
