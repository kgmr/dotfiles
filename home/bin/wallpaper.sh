dir="/home/kassio/Pictures/Wallpaper/real"

if [ $1 ]
then
    dir="/home/kassio/Pictures/Wallpaper"
fi

wall=$(ls $dir | grep -E '.jpg|.png' | shuf -n1)

feh --bg-fill "$dir/$wall"
#wal -i "$dir/$wall" -a 89 &
