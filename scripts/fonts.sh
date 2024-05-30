#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/config.rasi"

rofi_cmd() {
		rofi -dmenu -i \
		-p "Fonts" \
		-markup-rows \
		-theme "$theme"
		}

fc-list | cut -d':' -f1 | awk -F/ '{print $NF}' | sort -u | rofi_cmd >/dev/null 2&>1
