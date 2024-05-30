#!/bin/bash

theme="$HOME"/.config/rofi/config.rasi

# Rofi CMD
rofi_cmd() {
		rofi -dmenu -i \
		-p "Packages" \
		-markup-rows \
		-theme ${theme}
		}

man -k . | awk '{print $1}'| sort | rofi_cmd | xargs alacritty -e man

