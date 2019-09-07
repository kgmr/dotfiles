#!/bin/sh
#requires siji font
    if [ "$(playerctl status)" ]; then
        if [ "$(playerctl status | grep Paused | cut -d ' ' -f1)" = "Paused" ]; then 
                symbol=""
            else
                symbol=""
            fi
                artist=$(playerctl metadata artist)
                playing=$(playerctl metadata title)
                if [ "$artist" != "" ]; then
                    playing="$playing by $artist"
                fi

				size=${#playing}
				if [ $size -gt 45 ]; then 
                    playing=$(echo $playing | cut -c -45)
                    echo "$symbol$playing.. " || exit 1
                else
                    echo "$symbol$playing " || exit 1
                fi


    else
        echo " " || exit 1
    fi
