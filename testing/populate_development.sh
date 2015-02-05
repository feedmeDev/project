#!/bin/bash

#reset db
cd ..
cd feedme
rm db/schema.rb
rm db/development.sqlite3
rake db:migrate
#rails s&
#sleep 4
cd ../testing
echo "data base reset"
echo "repopulating now"
sleep 2

#person population
cd person
./add_student.sh
./add_staff.sh
cd ..

echo "people added"
sleep 1

#component population
cd component
./add.sh
cd ..

echo "components for meals added"
sleep 1

#meal population
cd meal
./add.sh
./add_components_to_meal.sh
cd ..

echo "meals added and components assigned"
sleep 1
#indications population
cd indications
./indicate.sh
./get_indications.sh

echo ""
echo ""

./get_report.sh
