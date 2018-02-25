if [ "$(pidof xbindkeys)" ]; then

    notify-send "Services already active"
else
~/bin/wallpaper.sh &
xbindkeys &
unclutter -grab &
fcitx&
~/bin/termite.sh &
redshift-gtk &
#compton --xrender-sync-fence &
xcompmgr&
volumeicon &
parcellite &
xfce4-power-manager &
dunst&
slstatus &

fi
