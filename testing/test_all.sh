#!/bin/bash

#login tests
cd login
./login_expect_fail.sh
echo ""
echo "expected failure"
echo ""
./login_expect_pass_staff.sh
./login_expect_pass_student.sh
echo ""
echo "expected pass"
echo ""
cd ..

echo "logins tested"
sleep 1

#report test
echo ""
echo ""

cd indications
./get_report.sh
cd ..

echo "tested report"
