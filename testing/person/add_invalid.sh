#!/bin/bash

curl -i -H "Content-Type: application/json" -X POST localhost:3000/allergen_warnings -d '{"allergen_warning": {"warning_title": "nuts", "warning_content": ""}}'

