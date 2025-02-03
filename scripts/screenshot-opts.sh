#!/usr/bin/env bash

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

copy_shot() { 
    wl-copy < "$dir/$file"
}


# Takes action depending on parameter
case $1 in
    full)
		# Takes full screenshot without the mouse shown and copies to the clipboard
		grim -o HDMI-A-1 "$dir/$file"
        copy_shot
		# Sends notification
		notify_view
		;;
		        
    area)
    	# Takes screenshot of selected area without the mouse shown and copies to the clipboard
		grim -g "$(slurp)" "$dir/$file"
        copy_shot
		notify_view
        ;;
        
    window)
    	# Takes screenshot of the active window without the mouse shown and copies to the clipboard
        grim -g "$(hyprctl clients -j | jq -r '.[] | select(.focusHistoryID == 0) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" "$dir/$file"
        copy_shot
		notify_view
        ;;    
esac
