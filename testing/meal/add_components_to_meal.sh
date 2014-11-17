#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/meal/add_component.json -d '{"meal":"1", "component":"1"}'
curl -i -H "Content-Type: application/json" -X POST localhost:3000/meal/add_component.json -d '{"meal":"1", "component":"2"}'
curl -i -H "Content-Type: application/json" -X POST localhost:3000/meal/add_component.json -d '{"meal":"1", "component":"3"}'
curl -i -H "Content-Type: application/json" -X POST localhost:3000/meal/add_component.json -d '{"meal":"1", "component":"4"}'
