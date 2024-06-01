#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/config.rasi"

rofi_cmd() {
		rofi -dmenu -i \
		-p "Fonts" \
		-sort \
		-sorting-method fzf \
		-markup-rows \
		-theme "$theme"
		}

fc-list | cut -d':' -f1 | awk -F/ '{print $NF}' | sed 's/\.[^.]*$//' | sort | rofi_cmd > /dev/null 2>&1
