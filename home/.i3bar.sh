#!/bin/sh
i3status --config ~/.i3status.conf | while :
do
        read line
	if [ $(pidof mpd) ];then
		if [ "$(mpc status | grep pause | cut -d ' ' -f1)" = "[paused]" ]; then
			symbol=""
		else
			symbol=""
		fi
        	playing=$(mpc current)
        	echo "$symbol  $playing | $line" || exit 1
	else
		echo $line || exit 1
	fi
done
