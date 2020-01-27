#!/bin/bash
PID=`ps ax | grep mc | grep -v grep | awk '{print $1}'`
if [  -n "$PID" ]
    then
    echo $PID
fi
#    else
#    echo "else"
#fi
