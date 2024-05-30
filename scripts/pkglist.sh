#!/bin/bash

theme="$HOME/.config/rofi/config.rasi"

# Rofi CMD
rofi_cmd() {
		rofi -dmenu -i \
		-p "Packages" \
		-sort \
		-sorting-method fzf \		
		-markup-rows \
		-theme "$theme"
		}

pkg=$(pacman -Qe | awk '{print $1}' | rofi_cmd | cut -d' ' -f1)
if [ -n "$pkg" ]; then
	alacritty -e sh -c "pacman -Qi $pkg ; read -p 'Press ENTER to exit'"
fi
