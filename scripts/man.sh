#!/bin/bash

theme="$HOME/.config/rofi/config-4.rasi"

# Rofi CMD
rofi_cmd() {
		rofi -theme-str "entry {placeholder: 'Search manpages...';}" \
        -theme-str "imagebox {background-image: url('~/dots/images/mars-car.jpg', width);}" \
        -dmenu -i \
		-p "Man Pages" \
		-sort \
		-sorting-method fzf \
        -markup-rows \
		-theme "$theme"
		}

selection=$(apropos -s 1,5,7 . | awk '{print $1}' | sort | uniq | rofi_cmd)

if [[ -z "$selection" ]] ; then
    exit 1
else
    alacritty -e man "$selection"
fi

