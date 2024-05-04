#!/usr/bin/env bash

# Specifies Theme
theme="$HOME"/.config/rofi/applet-config.rasi

# Message
mesg="Take a screenshot"

# Options
option_1="󰎯 Capture Desktop in 5s"
option_2="󰿫 Capture Desktop in 10s"
option_3=" Capture Desktop"
option_4=" Capture Area"
option_5="󰘔 Capture Window"



# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Passes variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

# Sets the file name format
time=`date '+%d-%m-%H-%M-%S'` # date-month-hours(24 hrs format)-minutes-seconds
dir="/home/abrar/Pictures/"  # screenshot folder
file="${time}.png"  # file name

# Sends notification whether screenshot is taken or not
notify_view() {
	notify_cmd_shot='dunstify -u normal -a Maim -i bell --replace=699'
	if [[ -e "$dir/$file" ]]; then
		${notify_cmd_shot} "Screenshot saved as "$file""
	else
		${notify_cmd_shot} "Failed to capture screenshot"
	fi
}

# Copies the screenshot to clipboard
copy_shot () {
	tee ~/Pictures/"$file" | xclip -selection clipboard -t image/png
}

# Does countdown and sends notification on countdown
countdown () {
	for sec in `seq $1 -1 1`; do
		dunstify -u normal -a Maim --replace=701 -i screenshot -t 1100 "Taking shot in : $sec seconds"
		sleep 1
	done
}

# Takes screenshots
full () {
	# Takes full screenshot without the mouse shown and copies to the clipboard
	maim -u | copy_shot
	# Sends notification
	notify_view
}

area () {
	# Takes screenshot of selected area without the mouse shown and copies to the clipboard
	maim -s -u | copy_shot
	notify_view
}

window () {
	# Takes screenshot of the active window without the mouse shown and copies to the clipboard
	maim -i `xdotool getactivewindow` -u | copy_shot
	notify_view
}

in5sec () {
	countdown '5'
	sleep 0.5
	maim -u | copy_shot
	notify_view
}

in10sec () {
	countdown '10'
	sleep 0.5
	maim -u | copy_shot
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
