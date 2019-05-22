#!/bin/bash
echo "###################simple exitcodes#####################"
false
echo "simple exitcode of false is $?" \
&& echo "simple exitcode of && is $?"
true
echo "simple exitcode of true $?" \
&& false || echo "simple exitcode of || is $?"

echo "###################complicated exitcodes################"
touch nofile.txt
cat nofile.txt | cat nofile1.txt | tee > /dev/null
echo "No error in pipeline 1: exitcode is ${PIPESTATUS[0]}, \
but there is an error in pipeline 2: exitcode is ${PIPESTATUS[1]}"
rm nofile.txt

EXITCODE=${PIPESTATUS[0]}
if [ $EXITCODE -ne "1" ]
    then
    echo "exitcode is $EXITCODE"
    else
    echo "exitcode is $EXITCODE"
    exit $EXITCODE
fi

echo "###############"
nohup cat nofile.txt 2>&1 > /dev/null