#!/bin/sh
mkdir ~/.cover
while true
do
	if mpc current --wait
       	then
		rm ~/.cover/*
		song_path="`mpc current --format %file%`"
		current_path=`dirname "$HOME/Music/$song_path"`
		echo $current_path
		comp=`find "$current_path" -iname cover\*`
		if [ "$comp" != "" ]
		then
			cover=`find "$current_path" -iname cover\*`
			echo if
		else
			ffmpeg -i ~/Music/"$song_path" ~/.cover/FRONT_COVER.jpeg
			cover=~/.cover/FRONT_COVER.jpeg
			echo else
		fi
		title="`mpc current --format %title%`"
		artist="`mpc current --format %artist%`"
		album="`mpc current --format %album%`"
		dur="`mpc current --format %time%`"
		convert "$cover" -resize 80x80 "$HOME/.cover/$title.png"
        #dunst n shiet
		#notify-send -a "Now Playing" -i ~/.cover/"$title".png "$title - $artist""\n$album\n\n$dur" 
        #most DEs
		notify-send -a "Now Playing" -i ~/.cover/"$title".png "$title - $artist" 
	fi

done
