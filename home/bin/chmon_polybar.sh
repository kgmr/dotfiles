
#!/bin/bash
intern=LVDS1
extern=VGA1
bar=vga
pkill polybar
if xrandr | grep "$extern disconnected"; then
    extern=HDMI1
    bar=hdmi
fi

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto && notify-send "Output: Default" && sleep 3 && polybar top &
else
    xrandr --output "$intern" --off --output "$extern" --auto && sleep 3 && notify-send "Output $extern" && polybar $bar

fi
