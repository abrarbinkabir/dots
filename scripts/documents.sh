#!/usr/bin/env bash

# Specifies Theme
theme="$HOME"/.config/rofi/config.rasi

rofi_cmd() {
		rofi -theme-str "window {width: 1000px;}" \
		-dmenu -i \
		-p "Search Files" \
		-markup-rows \
		-theme ${theme}
		}


# Finds files and folders from Documents, Downloads and Pictures folder >>
# Excludes hidden files and folders and Archives folder >>
# Removes /home/abrar from the path >>
# Pipes into Rofi dmenu >>
# Opens with the default application
xdg-open "$(find ~/Documents/ ~/Downloads/ ~/Pictures/ ! -path '*/.*' ! -path '/home/abrar/Documents/archives*' | sort | cut -d '/' -f 4- | rofi_cmd )"

