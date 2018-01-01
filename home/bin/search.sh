find . -not -path '*/\.*' -type f | rofi -dmenu -i > ~/.selected
if [ -s ~/.selected ]; then

    exo-open "$(head -n 1 -z ~/.selected)"
fi
