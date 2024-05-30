#!/usr/bin/env bash

# Specifies Theme
theme="$HOME/.config/rofi/config.rasi"

rofi_cmd() {
		rofi -theme-str "window {width: 1000px;}" \
		-dmenu -i \
		-p "Files" \
		-sort \
		-sorting-method fzf \		
		-markup-rows \
		-theme "$theme"
		}

# Finds files from Documents, Downloads and Pictures folder >>
# Excludes hidden files and the Archives folder >>
# Removes /home/abrar from the path >>
# Pipes into Rofi dmenu >>
# Opens with the default application
selection=$(find ~/Documents/ ~/Downloads/ ~/Pictures/ ~/dots/ ! -path '*/.*' ! -path '/home/abrar/Documents/archives*' -type f | sort | cut -d '/' -f 4- | rofi_cmd)

# if $selection exists then opens it with xdg-open
if [ -z ${selection} ] ; then
	exit 1
else
	xdg-open "$HOME/$selection"
fi
