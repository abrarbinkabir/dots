#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/config-3.rasi"

# Options
option_1=""
option_2=""
option_3=""
option_4=""
option_5=""

# Rofi CMD
menu() {
   rofi -dmenu \
		-markup-rows \
		-theme "$theme"
}

# Confirmation CMD
confirm() {
   rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 300px;}' \
   		-theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {font: "JetBrainsMono Nerd Font Propo Regular 13"; horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme "$theme"
}

day_today=$(date +%A)
date_today=$(date +%b' '%d', '%Y)
day_tomorrow=$(date --date='tomorrow' +%A)
date_tomorrow=$(date --date='tomorrow' +%b' '%d', '%Y)
hour_now=$(date +%H)
hour_now=${hour_now#0} # remove leading zeros

# Passes variables to rofi dmenu
main() {
	selection="$(echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5"|menu)"
	if [[ -n "$selection" && "$selection" != "$option_5" ]]; then
		answer="$(echo -e "Yes\nNo" | confirm)"
		if [[ $answer == "Yes" ]]; then
			case ${selection} in
			    "$option_1")
                    if [[ "$hour_now" -le 4 ]]; then
                        notify-send -u normal -a Today -i calendar "${date_today} ($day_today)"
                    else
                        notify-send -u normal -a Tomorrow -i calendar "${date_tomorrow} ($day_tomorrow)"
                    fi
                    sleep 4
					notify-send -u normal -a Systemctl -i poweroff -t 2000 "System will shutdown now" &&
			    	sleep 2 
			    	systemctl poweroff
			        ;;
			    "$option_2")
			    	notify-send -u normal -a Systemctl -i restart -t 2000 "System will reboot now" &&
			    	sleep 3
			    	systemctl reboot
			        ;;
			    "$option_3")
			    	notify-send -u normal -a Systemctl -i logout -t 2000 "System will logout now" &&
			    	sleep 3
			    	hyprctl dispatch exit
			        ;;
			    "$option_4")
					systemctl suspend
			        ;;			      
			esac
		else
			exit 1
		fi
	elif [[ -n "$selection" && "$selection" == "$option_5" ]]; then
		hyprlock -q
	else
		exit 1
	fi
}

main
