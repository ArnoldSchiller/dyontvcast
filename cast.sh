#!/bin/bash
# Simple bash script to start Youtube videos on the dyon
# Author: Arnold Schiller
# License: Apache 2.0 

ARG=$1
DYONTV=$2
PORT=56789
# Instead of $2 enter the IP address in the variable DYONTV=10.0.0.34
CURL=`type -P curl`
if [ -z "$CURL" ] ; then
	echo curl not found! Script needs curl:
	exit 1	
fi

if [ -z "$DYONTV" ] ; then
	echo Usage: $0 Youtubeurl IP-Adress-Dyontv;
	echo Example: $0 https://www.youtube.com/watch?v=1wQ_E49y3N8 192.168.1.23
	echo Stop Video: $0 stop DYONTVIP
        echo 	
	exit 1
fi 
	
if [ "x$ARG" = "xstop" ]
		then
    		$CURL -H "Content-Type: application/json" http://$DYONTV:$PORT/apps/YouTube/run -X DELETE 
    		exit 0
fi

$CURL -H "Content-Type: application/json" http://$DYONTV:$PORT/apps/YouTube -X POST -d v=`echo $ARG | sed 's/.*v=\(.*\)/\1/'` 

