#!/bin/bash
# Simple bash script to start Youtube videos on the dyon SmartTV
# Author: Arnold Schiller
# License: Apache 2.0 
# URL: https://github.com/ArnoldSchiller/dyontvcast/
# ARG1 is the youtube-URL
ARG=$1
# ARG2 IP or Hostname of Dyon tv
DYONTV=$2
# Port normally http://DYONTVIP:56790/dd.xml minus 1 
PORT=56789
# This script needs curl
CURL=`type -P curl`

if [ -z "$CURL" ] ; then
	echo curl not found! Script needs curl:
	exit 1	
	elif [ -z "$DYONTV" ] ; then
	echo Usage: $0 Youtubeurl IP-Adress-Dyontv;
	echo Example: $0 https://www.youtube.com/watch?v=1wQ_E49y3N8 192.168.1.23
	echo Stop Video: $0 stop DYONTVIP
        echo 	
	exit 1
	elif [ -z "$1" ]; then
       	echo $0 Youtubeurl
	exit 1
fi
	

if [ "x$ARG" = "xstop" ]
		then
    		$CURL -H "Content-Type: application/json" http://$DYONTV:$PORT/apps/YouTube/run -X DELETE 
    		exit 0
fi

VIDEO=`echo $ARG | sed 's/.*v=\(.*\)/\1/'`

if [[ $ARG == *"v="* ]]; then
	$CURL -H "Content-Type: application/json" http://$DYONTV:$PORT/apps/YouTube -X POST -d v=$VIDEO 
else
        #Ok v= not found. Try to get the Videourl
	LOCATION=`$CURL -I $ARG | grep -i location | sed 's/location://'` 
	URL=`echo $LOCATION |  cut -d'&' -f1`
	VIDEO=`echo $URL | sed 's/.*v=\(.*\)/\1/'`
        $CURL -H "Content-Type: application/json" http://$DYONTV:$PORT/apps/YouTube -X POST -d v=$VIDEO

	echo $0 $URL $DYONTV
fi
