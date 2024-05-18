#!/usr/bin/env bash

# Specifies Theme
theme="$HOME"/.config/rofi/applet-config.rasi
mesg="Backup" 
dt="$(date +%Y%m%d)"

option_1=" Pacman Package List"
option_2=" Push Dotfiles Repo"

# Rofi CMD
rofi_cmd() {
   rofi -theme-str 'listview {columns: 1; lines: 2;}' \
		-theme-str 'window {width: 400px;}' \
		-dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		pacman -Qe > ~/backups/packages/pkg-${dt}.md && notify-send -u normal -a "Package List" -i bell -t 2000 "Backup successful!"
        ;;
	$option_2)
		cd ~/Documents/dotfiles && git add -A && git commit -m "Minor changes" && git push origin main && notify-send -u normal -a "Dotfiles" -i bell -t 2000 "Pushed successfully!"
		;;
esac
