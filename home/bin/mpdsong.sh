#!/bin/sh
#requires siji font
    if [ "$(mpc current)" ]
    then
        if [ "$(mpc status | grep pause | cut -d ' ' -f1)" = "[paused]" ]; then 
                symbol=""
            else
                symbol=""
            fi
                playing=$(mpc current)
                echo "$symbol$playing " || exit 1

    else
        echo " " || exit 1
    fi
