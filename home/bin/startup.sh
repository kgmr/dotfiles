#!/bin/sh
if [ "$(pidof xbindkeys)" ]; then

    notify-send "Services already active"
else
feh --bg-center ~/Pictures/wallp.jpg
cd ~/ && xbindkeys &
unclutter -grab &
#compton --xrender-sync-fence &
xcompmgr&
volumeicon &
parcellite &
dunst&
fi
