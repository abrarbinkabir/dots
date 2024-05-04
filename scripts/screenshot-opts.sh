#!/usr/bin/env bash

# Sets the file name format
time=`date '+%Y%m%d%H%M%S'` # date-month-hours(24 hrs format)-minutes-seconds
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

# Takes action depending on parameter
case $1 in
    full)
		# Takes full screenshot without the mouse shown and copies to the clipboard
		maim -u | copy_shot
		# Sends notification
		notify_view
		;;
		        
    area)
    	# Takes screenshot of selected area without the mouse shown and copies to the clipboard
		maim -s -u | copy_shot
		notify_view
        ;;
        
    window)
    	# Takes screenshot of the active window without the mouse shown and copies to the clipboard
		maim -i `xdotool getactivewindow` -u | copy_shot
		notify_view
        ;;    
esac
