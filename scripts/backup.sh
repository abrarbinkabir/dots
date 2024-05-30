#!/usr/bin/env bash

# Specifies theme
theme="$HOME"/.config/rofi/applet-config.rasi
mesg="Backup" 
dt="$(date +%Y%m%d)"

# Defines options
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

# Passes options to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
    	pacman -Qen > "$HOME/dots/misc/npkglist-${dt}.md" &&
    	find "$HOME/dots/misc/" -type f -iname 'npkglist*' -exec ls -r {} + | tail -n +4 | xargs -I {} mv {} ~/.local/share/Trash/files/ &&
    	pacman -Qem > "$HOME/dots/misc/fpkglist-${dt}.md" &&
    	find "$HOME/dots/misc/" -type f -iname 'fpkglist*' -exec ls -r {} + | tail -n +4 | xargs -I {} mv {} ~/.local/share/Trash/files/
    	if [ $? -eq 0 ] ; then
			notify-send -u normal -a "Package List" -i bell -t 3000 "Backup successful!"
		else
			notify-send -u normal -a "Package List" -i bell -t 3000 "Backup unsuccessful!"
		fi
        ;;
	$option_2)
		cd "$HOME/dots" && git add -A && git commit -m "Minor changes" && git push origin main
	if [ $? -eq 0 ] ; then
		notify-send -u normal -a "Dotfiles" -i bell -t 3000 "Pushed successfully!"
	else
		notify-send -u critical -a "Dotfiles" -i bell -t 3000 "Push unsuccessful!"
	fi
    ;;
esac
