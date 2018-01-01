#!/bin/bash
intern=LVDS1
extern=VGA1
if xrandr | grep "$extern disconnected"; then
    extern=HDMI1
fi

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto && notify-send "Output: Default"
else
    xrandr --output "$intern" --off --output "$extern" --auto && notify-send "Output $extern"

fi
