#!/bin/bash

curl -i -H "Content-Type: application/json" -X PUT localhost:3000/allergen_warnings/1 -d '{"allergen_warning": {"warning_title": "no nuts"}}'


