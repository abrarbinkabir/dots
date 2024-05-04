#!/usr/bin/env bash

# Specifies Theme
theme="$HOME"/.config/rofi/applet-config.rasi
mesg="Backup" 
dt="$(date +%Y%m%d)"

option_1=" Pacman Package List"

# Rofi CMD
rofi_cmd() {
	rofi -theme-str 'listview {columns: 1; lines: 1;}' \
		-theme-str 'window {width: 400px;}' \
		-dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		pacman -Qet > ~/backups/packages/pkg-${dt}.md && notify-send -u normal -a "Pacman" -i bell -t 2000 "Package list backed up at ~/backups/packages/pkg-${dt}.md"
        if [ $(ls -l | wc -l) -gt 4 ] ; then
            ls -t | tail -n 1 | xargs rm
        fi
        ;;
esac
