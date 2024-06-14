#!/bin/bash

theme="$HOME/.config/rofi/config.rasi"

# Rofi CMD
rofi_cmd() {
		rofi -theme-str "window {width: 600px;}" \
		-dmenu -i \
		-p "Pkill" \
		-sort \
		-sorting-method fzf \
        -markup-rows \
		-theme "$theme"
		}

ps --user "$USER" -F | awk '{print $2" "$11}' | tail -n +2 | rofi_cmd | cut -d" " -f1 | xargs kill -9
