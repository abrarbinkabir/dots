#!/usr/bin/env bash

# Specifies Theme
theme="$HOME/.config/rofi/applet-config.rasi"

# Theme Elements
get_status(){
	status=$(mpc status | awk 'FNR == 2 {print $1}' | sed -e 's|\[||g' -e 's|\]||g')
}

get_status
if [[ -z "$status" ]]; then
	mesg="MPD is Offline"
else
	mesg="Track Controls"
fi

if [[ ${status} == "playing" ]]; then
		option_1=" Pause"
	else
		option_1=" Play"
	fi
	option_2=" Stop"
	option_3=" Next"
	option_4=" Previous"
	option_5=" Repeat"
	option_6=" Random"

# Rofi CMD
rofi_cmd() {
	rofi -theme-str 'listview {columns: 1; lines: 6;}' \
		-dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme "$theme"
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

repeat_mode(){
	repeat=$(mpc status | awk '/repeat/ {print $4}')
	notify-send -u normal -a "Music Player Daemon" -i bell -t 1500 "Repeat mode turned"\n "$repeat"
}

random_mode(){
	random=$(mpc status | awk '/repeat/ {print $6}')
	notify-send -u normal -a "Music Player Daemon" -i bell -t 1500 "Repeat mode turned $random"
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		mpc -q toggle && get_status && notify-send -u normal -a "Track ${status}" -i bell -t 1500 "`mpc current`"
        ;;
    $option_2)
		mpc -q stop && notify-send -u normal -a "Music Player Daemon" -i bell -t 1500 "MPD Stopped" 
        ;;
    $option_3)
		mpc -q next && notify-send -u normal -a "Playing Now" -i bell -t 1500 "`mpc current`"
        ;;
    $option_4)
		mpc -q prev && notify-send -u normal -a "Playing Now" -i bell -t 1500 "`mpc current`"
        ;;
    $option_5)
		mpc -q repeat && repeat_mode
        ;;
    $option_6)
		mpc -q random && random_mode
        ;;
esac
