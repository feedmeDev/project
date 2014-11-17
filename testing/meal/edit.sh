#!/bin/bash

curl -i -H "Content-Type: application/json" -X PUT localhost:3000/components/1.json -d '{"component": {"description":"mod description 1 v2"}}'
