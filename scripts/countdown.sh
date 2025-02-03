#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/applet-config.rasi"
mesg="Count Days"

count_01=$(echo "scale=0; ($(date '+%s') - $(date -d 20250116 '+%s'))/(60*60*24)" | bc)
count_02=$(echo "scale=0; ($(date -d 20250301 '+%s') - $(date '+%s'))/(60*60*24)" | bc)
count_03=$(echo "scale=0; ($(date '+%s') - $(date -d 20241210 '+%s'))/(60*60*24)" | bc)
count_04=$(echo "scale=0; ($(date -d 20250219 '+%s') - $(date '+%s'))/(60*60*24)" | bc)
count_05=$(echo "scale=0; ($(date '+%s') - $(date -d 20240731 '+%s'))/(60*60*24)" | bc)
count_06=$(echo "scale=0; ($(date '+%s') - $(date -d 20240805 '+%s'))/(60*60*24)" | bc)

# Options
option_1="Refraining from bad habit: $count_01 days"
option_2="Days before Ramadan: $count_02 days"
option_3="Midterm exam ended $count_03 days ago"
option_4="Course membership expires in: $count_04 days"
option_5="Appointment taken $count_05 days ago"
option_6="36th July was $count_06 days ago"

# Rofi CMD
rofi_cmd() {
   rofi -theme-str 'listview {columns: 1; lines: 6;}' \
   		-theme-str 'window {width: 550px;}' \
		-dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme "$theme"
}

# Passes options to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

run_rofi > /dev/null 2>&1
