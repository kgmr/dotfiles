if [ "$(pidof xbindkeys)" ]; then

    notify-send "Services already active"
else
xbindkeys&
fcitx&
termite.sh&
unclutter -grab &
nm-applet&
redshift-gtk&
compton --xrender-sync-fence &
volumeicon&
parcellite&
fcitx&
xfce4-power-manager&
~/bin/wallpaper.sh&
dunst&

fi
