#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/meal/add_component.json -d '{"meal":"1", "component_list":["1","2","3","4"]}'
