#!/usr/bin/env bash

# Specifies Theme
theme="$HOME"/.config/rofi/applet-config.rasi

# Message to show uptime
# Gets the uptime >>
# Replaces 'up ' with ''
mesg="Uptime: `uptime -p | sed -e 's/up //g' -e 's/\shour[s]\?,/h/g' -e 's/\sminute[s]\?/m/g'`"

# Options
option_1=" Shut Down"
option_2=" Log Out"
option_3=" Restart"
option_4=" Suspend"
option_5=" Lock"
yes='Yes'
no='No'

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

# Confirmation CMD
confirm_cmd() {
   rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {font: "JetBrainsMono Nerd Font Propo Regular 12"; horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${theme}
}

# Asks for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# If confirmed then further proceeds
confirm_run () {	
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
        ${1} && ${2} && ${3}
    else
        exit
    fi	
}

# Executes command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		confirm_run 'systemctl poweroff'	
	elif [[ "$1" == '--opt2' ]]; then
		confirm_run 'qtile cmd-obj -o cmd -f shutdown'
	elif [[ "$1" == '--opt3' ]]; then
		confirm_run 'systemctl reboot'
	elif [[ "$1" == '--opt4' ]]; then
		confirm_run 'systemctl suspend'	
	elif [[ "$1" == '--opt5' ]]; then
		betterlockscreen -l
		
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
