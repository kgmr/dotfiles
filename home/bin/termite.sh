#!/bin/sh
hour="$(date +%H)"
if [ 7 -le $hour ] && [ $hour -le 18 ] ; then
    cp ~/.config/termite/themes/base16-tomorrow.config ~/.config/termite/config
    killall -USR1 termite
else
    cp ~/.config/termite/themes/base16-gruvbox-dark-pale.config ~/.config/termite/config
    killall -USR1 termite
fi
