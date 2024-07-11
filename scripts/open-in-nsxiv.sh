#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/applet-config.rasi"
mesg="Open in NSXIV"

rofi_cmd() {
		rofi -theme-str "listview {columns: 1; lines: 4; }" \
        -dmenu -i \
        -mesg "$mesg"\
		-theme "$theme"
		}
# Options
options=(
        " Shots" "$HOME/Pictures/shots"
        " Screenshots" "$HOME/Pictures/Screenshots"
        " Pictures" "$HOME/Pictures"
        " camera" "$HOME/camera"
)

run_rofi() {
    for ((i = 0; i < ${#options[@]}; i += 2)); do
        echo "${options[i]}"
    done | rofi_cmd
}

selection=$(run_rofi)

for ((i = 0; i < ${#options[@]}; i += 2)); do
    if [[ "$selection" == "${options[i]}" ]]; then
        "$HOME/.config/scripts/nsxiv.sh" "${options[i+1]}"
        break
    fi
done
