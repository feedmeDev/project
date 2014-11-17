#!/bin/bash

#person population
cd person
./add_student.sh
./add_staff.sh
cd ..

#component population
cd component
./add.sh
cd ..

#meal population
cd meal
./add.sh
./add_components_to_meal.sh
cd ..

#indications population
cd indications
./indicate.sh
