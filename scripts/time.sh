#!/usr/bin/env bash

# Imports current theme
source ~/.config/scripts/bs_time.sh
source "$HOME"/.config/rofi/applets/type-1/theme.bash
theme="$type/$style"

mesg="Time and Date"

now=`date '+%I:%M %p'`
today=`date '+%B %d, %Y'`
weekday=`date '+%A'`
weeknum=`date '+%U'`

# Options
option_1="Now: $now"
option_2="Today: $today"
option_3="Weekday: $weekday"
option_4="Week No: $weeknum"
option_5="Today: $bs_mo $bs_dt, $bs_yr Bongabdo"

# Rofi CMD
rofi_cmd() {
   rofi -theme-str 'listview {columns: 1; lines: 5;}' \
		-dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Passes variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5" | rofi_cmd
}

chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		echo "$option_1" | cut -d ':' -f2- | sed -e 's/^[[:space:]]*//' | xclip -r -selection clipboard
        ;;
    $option_2)
		echo "$option_2" | cut -d ':' -f2- | sed -e 's/^[[:space:]]*//' | xclip -r -selection clipboard
        ;;
    $option_3)
		echo "$option_3" | cut -d ':' -f2- | sed -e 's/^[[:space:]]*//' | xclip -r -selection clipboard 
        ;;
    $option_4)
		echo "$option_4" | cut -d ':' -f2- | sed -e 's/^[[:space:]]*//' | xclip -r -selection clipboard
        ;;
    $option_5)
		echo "$option_5" | cut -d ':' -f2- | sed -e 's/^[[:space:]]*//' | xclip -r -selection clipboard
        ;;
esac\t
