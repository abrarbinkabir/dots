#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/applet-config.rasi"
mesg="Open in NeoVim"

rofi_cmd() {
		rofi -theme-str "listview {columns: 1; lines: 8; }" \
        -dmenu -i \
        -mesg "$mesg"\
		-theme "$theme"
		}
# Options
options=(
        " scripts" "$HOME/dots/scripts/"
        " notes" "$HOME/Documents/50-notes/"
        " nvim" "$HOME/dots/nvim/"
        " qtile" "$HOME/dots/qtile/"
        " dots" "$HOME/dots/"
        " code" "$HOME/Documents/50-notes/61-coding/"
        "󰌽 linux" "$HOME/Documents/50-notes/62-linux/"

    )

run_rofi() {
    for ((i = 0; i < ${#options[@]}; i += 2)); do
        echo "${options[i]}"
    done | rofi_cmd
}

selection=$(run_rofi)

for ((i = 0; i < ${#options[@]}; i += 2)); do
    if [[ "$selection" == "${options[i]}" ]]; then
        alacritty -e nvim "${options[i+1]}"
        break
    fi
done
