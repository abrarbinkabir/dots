#!/bin/bash

theme="$HOME/.config/rofi/config.rasi"

# Rofi CMD
rofi_cmd() {
		rofi -dmenu -i \
		-p "Packages" \
		-markup-rows \
		-theme "$theme"
		}

pkg=$(pacman -Qe | rofi_cmd | cut -d' ' -f1)
if [ -n "$pkg" ]; then
	alacritty -e sh -c "pacman -Qi $pkg ; read -p 'Press ENTER to exit'"
fi
