dir="/home/kassio/Pictures/Wallpaper/real"

if [ $1 ]
then
    dir="/home/kassio/Pictures/Wallpaper"
fi



wall=$(ls $dir | grep -E '.jpg|.png' | shuf -n1)

feh --bg-fill "$dir/$wall"
#wal -i "$dir/$wall" -a 89 &

if [ $2 ]
then
    wal -i "$dir/$wall" -a 93 >> /dev/null
else
    rm ~/.cache/wal/sequences
    touch ~/.cache/wal/sequences
fi
