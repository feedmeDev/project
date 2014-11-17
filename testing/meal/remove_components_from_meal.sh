#!/bin/bash

curl -i -H "Content-Type: application/json" -X DELETE localhost:3000/meal/delete_component.json -d '{"meal":"1", "component":"2"}'
