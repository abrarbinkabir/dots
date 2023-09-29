#!/bin/bash
rofi_cmd() {
	rofi -theme-str "window {width : 1100px;}" \
		-dmenu -i \
		-p "Search Files:" \
		-markup-rows
		}


# Finds files and folders from Documents, Downloads and Pictures folder >>
# Excludes hidden files and folders and Archives folder >>
# Removes /home/abrar from the path >>
# Pipes into Rofi dmenu >>
# Opens with the default application
xdg-open "$(find ~/Documents/ ~/Downloads/ ! -path '*/.*' ! -path '/home/abrar/Documents/90-archives*' | cut -d '/' -f4- | rofi_cmd )"

