function check_availability {
    while [ "$RESPONSE_LOCAL" != "302" ]
    do
	TDATE=`date +'%H:%M:%S'`
    	RESPONSE_LOCAL=`curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:8080/`
	echo "$TDATE HTTP status is $RESPONSE_LOCAL n=$n"
        sleep 5
    	(( n++ ))
        if [ "$n" -gt "100" ]
    	    then
    	    echo "$TDATE too much tries failed"
    	    exit 1
    	fi
    done
    echo "$TDATE HTTP status is $RESPONSE_LOCAL n=$n"
}


tail -f nohup.out &
tailPID=$!
echo $tailPID
check_availability
kill -9 $tailPID
echo "$tailPID tail process killed"
exit 0

