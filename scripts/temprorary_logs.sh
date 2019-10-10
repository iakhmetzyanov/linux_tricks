#!/bin/bash
#throw logs into shell for 60 seconds and exit
tail -f application.log &
tailPID=$!
sleep 60
kill $tailPID
exit 0
