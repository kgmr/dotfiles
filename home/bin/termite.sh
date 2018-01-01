#!/bin/sh
hour="$(date +%H)"
cp ~/.config/termite/options ~/.config/termite/config
if [ 7 -le $hour ] && [ $hour -le 18 ] ; then
    cat ~/.config/termite/themes/base16-tomorrow.config >> ~/.config/termite/config
    killall -USR1 termite
else
    cat ~/.config/termite/themes/base16-gruvbox-dark-pale.config >> ~/.config/termite/config
    killall -USR1 termite
fi
