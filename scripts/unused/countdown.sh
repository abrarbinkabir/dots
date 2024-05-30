#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/applet-config.rasi"
mesg="Count Days"

count_01=$(echo "scale=2; ($(date -d 20240618 +%s) - $(date +%s))/(60*60*24)" | bc)
count_02=$(echo "scale=2; ($(date -d 20240702 +%s) - $(date +%s))/(60*60*24)" | bc)
count_03=$(echo "scale=2; ($(date +%s) - $(date -d 20240526 +%s))/(60*60*24)" | bc)
count_04=$(echo "scale=2; ($(date -d 20240805 +%s) - $(date +%s))/(60*60*24)" | bc)

# Options
option_1="Days remaining until Eid: $count_01"
option_2="Vacation ends in: $count_02 days"
option_3="Spent in vacation: $count_03 days"
option_4="Days remaining until Birthday: $count_04"


# Rofi CMD
rofi_cmd() {
   rofi -theme-str 'listview {columns: 1; lines: 4;}' \
   		-theme-str 'window {width: 500px;}' \
		-dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme "$theme"
}

# Passes options to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}

run_rofi > /dev/null 2>&1
