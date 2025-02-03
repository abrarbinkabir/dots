#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/config-3.rasi"

# Options
option_1="05"
option_2="10"
option_3=""
option_4=""
option_5="󰘔"



# Rofi CMD
rofi_cmd() {
	rofi -dmenu -i \
		-mesg "$mesg" \
		-markup-rows \
		-theme "$theme"
}

# Passes variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Sets the file name format
time=$(date '+%Y%m%d%H%M%S') # date-month-hours(24 hrs format)-minutes-seconds
dir="$HOME/Pictures/shots"  # screenshot folder
file="${time}.png"  # file name

# Sends notification whether screenshot is taken or not
notify_view() {
	notify_cmd_shot='notify-send -u normal -a Screenshot -i screenshot'
	if [[ -e "$dir/$file" ]]; then
		${notify_cmd_shot} "Saved successfully!"
	else
		${notify_cmd_shot} "Failed to capture!"
	fi
}

# Copies the screenshot to clipboard
copy_shot () {
	wl-copy < "$dir/$file"
}

# Does countdown and sends notification on countdown
countdown () {
    for sec in $(seq "$1" -1 1) ; do
		notify-send -u normal -a Screenshot -r 701 -i timer -t 1100 "Taking shot in: $sec sec"
		sleep 1
	done
}

# Takes screenshots
full () {
	# Takes full screenshot without the mouse shown and copies to the clipboard
	sleep 0.5
    grim -o HDMI-A-1 "$dir/$file"
    copy_shot
	# Sends notification
	notify_view
}

area () {
	# Takes screenshot of selected area without the mouse shown and copies to the clipboard
    grim -g "$(slurp)" "$dir/$file"
    copy_shot
	notify_view
}

window () {
	# Takes screenshot of the active window without the mouse shown and copies to the clipboard
    sleep 0.5
    grim -g "$(hyprctl clients -j | jq -r '.[] | select(.focusHistoryID == 0) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" "$dir/$file"
    copy_shot
	notify_view
}

in5sec () {
	countdown '5'
	sleep 0.5
	grim -o HDMI-A-1 "$dir/$file"
    copy_shot
	notify_view
}

in10sec () {
	countdown '10'
	sleep 0.5
	grim -o HDMI-A-1 "$dir/$file"
    copy_shot
	notify_view
}

# Executes command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		in5sec
	elif [[ "$1" == '--opt2' ]]; then
		in10sec
	elif [[ "$1" == '--opt3' ]]; then
		full
	elif [[ "$1" == '--opt4' ]]; then
		area
	elif [[ "$1" == '--opt5' ]]; then
		window
	
	fi
}

# Takes action according to selected options
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
    $option_5)
		run_cmd --opt5
        ;;
esac
