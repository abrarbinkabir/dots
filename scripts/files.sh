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

selection=$(find ~/Documents/ ~/Downloads/ ~/Pictures/ ~/dots/ ! -path '*/.*' -type f | sort | cut -d '/' -f 4- | rofi_cmd)

# if $selection exists then opens it with xdg-open
if [ -z "$selection" ] ; then
	exit 1
else
	xdg-open "$HOME/$selection"
fi
