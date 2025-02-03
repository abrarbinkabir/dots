#!/bin/bash

# Import Current Theme
theme="$HOME/.config/rofi/config-3.rasi"

# Theme Elements
status="`mpc status`"

# Theme Elements
if [[ "$status" == *"[playing]"* ]]; then
    option_1=""
else
    option_1=""
fi
option_2=""
option_3=""
option_4=""
option_5=""
option_6=""

# Toggle Actions
active=''
# Repeat
if [[ ${status} == *"repeat: on"* ]]; then
    active="-a 4"
fi
# Random
if [[ ${status} == *"random: on"* ]]; then
    [ -n "$active" ] && active+=",5" || active="-a 5"
fi

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: 1; lines: 6;}" \
		-dmenu \
		-markup-rows \
        "$active"\
		-theme "$theme"
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		mpc -q toggle
	elif [[ "$1" == '--opt2' ]]; then
		mpc -q stop
	elif [[ "$1" == '--opt3' ]]; then
		mpc -q next
	elif [[ "$1" == '--opt4' ]]; then
		mpc -q prev
	elif [[ "$1" == '--opt5' ]]; then
		mpc -q repeat
	elif [[ "$1" == '--opt6' ]]; then
		mpc -q random
	fi
}

# Actions
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
    $option_6)
		run_cmd --opt6
        ;;
esac
