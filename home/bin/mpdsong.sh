#!/bin/sh
#requires siji font
    if [ "$(mpc current)" ]; then
        if [ "$(mpc status | grep pause | cut -d ' ' -f1)" = "[paused]" ]; then 
                symbol=""
            else
                symbol=""
            fi
                playing=$(mpc current)
				size=${#playing}
				if [ $size -gt 40 ]; then 
                    playing=$(echo $playing | cut -c -38)
                    echo "$symbol$playing.. " || exit 1
                else
                    echo "$symbol$playing " || exit 1
                fi


    else
        echo " " || exit 1
    fi
