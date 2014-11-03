#!/bin/bash

curl -i -H "Content-Type: application/json" -H "Content-Length: 0" -X PUT localhost:3000/people/reactivate/1.json
