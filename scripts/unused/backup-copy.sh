#!/usr/bin/env bash

# Import Current Theme
source "$HOME"/.config/rofi/applets/type-1/theme.bash
theme="$type/$style"
mesg="Backup" 
dt="$(date +%Y%m%d)"

option_1="Rclone Download"
option_2="Rclone Upload"
option_3="Pacman Package List"
option_4="Restic Backup"

# Rofi CMD
rofi_cmd() {
	rofi -theme-str 'listview {columns: 1; lines: 4;}' \
		-theme-str 'window {width: 400px;}' \
		-dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		rclone sync gdrive: ~/Documents/10-semester && notify-send -u normal -a "Rclone Download" -i bell -t 2000 "Download completed"
        ;;
    $option_2)
		mpc -q stop && notify-send -u normal -a "Music Player Daemon" -i bell -t 1500 "MPD Stopped" 
        ;;
    $option_3)
		pacman -Qet > ~/backups/packages-${dt}.md && notify-send -u normal -a "Pacman" -i bell -t 2000 "Package list backed up at ~/backups/packages-${dt}.md"
        ;;
    $option_4)
		restic -r /run/media/abrar/ABRAR --verbose backup ~/Documents ~/Downloads ~/Pictures ~/backups ~/camera ~/whatsapp && notify-send -u normal -a "Restic Backup " -i bell -t 2000 "Backup completed"
        ;;

esac
