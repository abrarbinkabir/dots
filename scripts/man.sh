#!/bin/bash

theme="$HOME/.config/rofi/config.rasi"

# Rofi CMD
rofi_cmd() {
		rofi -theme-str "window {width: 800px;}" \
		-dmenu -i \
		-p "Man Pages" \
		-sort \
		-sorting-method fzf \		
		-markup-rows \
		-theme "$theme"
		}
apropos -s 1,5,7 . | awk '{print $1}' | sort | uniq | rofi_cmd | xargs alacritty -e man

