#!/bin/bash
if [ "$1" != "" ]; then
    notify-send -a "Qopen" "Updating search cache"
    find ~/ -mount -not -path "*/node_modules*" -and -not -path "*/\.*" -and -not -path "*/tmp*" -and -not -path "*/Music* " > .files
fi

x=$(cat .files | rofi -dmenu -sync -i -p "files:")
if [ "$x" != "" ]; then
exo-open "$x"
fi
