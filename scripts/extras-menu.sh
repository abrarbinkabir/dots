#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/applet-config.rasi"
mesg="Extra Scripts"

rofi_cmd() {
		rofi -theme-str 'listview {columns: 1; lines: 4;}' \
		-dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme "$theme"
		}

# Options
option_1=" Installed Packages"
option_2=" Count Days"
option_3=" Installed Fonts"
option_4=" Kill a Process"

run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}

chosen=$(run_rofi)

case "$chosen" in
	$option_1)
		$HOME/.config/scripts/pkglist.sh
		;;
	$option_2)
		$HOME/.config/scripts/countdown.sh
		;;
	$option_3)
		$HOME/.config/scripts/fonts.sh
		;;
	$option_4)
		$HOME/.config/scripts/pkglist.sh
		;;
esac	
