#!/bin/bash
rotation=$(cat /tmp/rotation)
if [ "$rotation" == "normal" ] || [ "$rotation" == "inverted" ]; then
    latte-dock -r --layout Default  & > /dev/null
else
    latte-dock -r --layout Tablet2 & > /dev/null
fi

    
