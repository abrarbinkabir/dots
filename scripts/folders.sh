#!/usr/bin/env bash

# Specifies Theme
theme="$HOME/.config/rofi/config.rasi"

rofi_cmd() {
		rofi -theme-str "window {width: 900px;}" \
		-dmenu -i \
		-p "Folders" \
		-markup-rows \
		-theme "$theme"
		}


# Finds folders from Documents, Downloads and Pictures folder >>
# Excludes hidden folders and the Archives folder >>
# Removes $HOME from the path >>
# Pipes into Rofi dmenu >>
# Opens with the default application
selection=`find ~/Documents/ ~/Downloads/ ~/Pictures/ ~/dots/ ! -path '*/.*' ! -path '/home/abrar/Documents/archives*' -type d | sort | cut -d '/' -f 4- | rofi_cmd`

# if $selection exists then opens it with xdg-open
if [ -z $selection] ; then
	exit 1
else
	xdg-open "$HOME/$selection"
fi

