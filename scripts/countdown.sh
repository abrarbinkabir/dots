#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/applet-config.rasi"
mesg="Count Days"

count_01=$(echo "scale=2; ($(date -d 20240628 '+%s') - $(date '+%s'))/(60*60*24)" | bc)
count_02=$(echo "scale=2; ($(date -d 20240702 '+%s') - $(date '+%s'))/(60*60*24)" | bc)
count_03=$(echo "scale=2; ($(date '+%s') - $(date -d 20240527 '+%s'))/(60*60*24)" | bc)
count_04=$(echo "scale=2; ($(date -d 20240805 '+%s') - $(date '+%s'))/(60*60*24)" | bc)
count_05=$(echo "scale=2; ($(date -d 20240707 '+%s') - $(date '+%s'))/(60*60*24)" | bc)

# Options
option_1="Dadubari visit in: $count_01 days"
option_2="Vacation ends in: $count_02 days"
option_3="Spent in vacation: $count_03 days"
option_4="My Birthday in: $count_04 days"
option_5="Abbu's Birthday in: $count_05 days"


# Rofi CMD
rofi_cmd() {
   rofi -theme-str 'listview {columns: 1; lines: 5;}' \
   		-theme-str 'window {width: 500px;}' \
		-dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme "$theme"
}

# Passes options to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

run_rofi > /dev/null 2>&1
