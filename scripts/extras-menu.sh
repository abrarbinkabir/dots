#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/applet-config.rasi"
mesg="Extra Scripts"

rofi_cmd() {
		rofi -theme-str 'listview {columns: 1; lines: 6;}' \
		-dmenu \
		-mesg "$mesg" \
		-markup-rows \
		-theme "$theme"
		}
# Options
options=(
        " Count Days" "$HOME/.config/scripts/countdown.sh"
        " Toggle Nightlight" "$HOME/.config/scripts/nightlight.sh"
        " Browse Archives" "$HOME/.config/scripts/archives.sh"
        " Installed Packages" "$HOME/.config/scripts/pkglist.sh"
        " Kill Processes" "$HOME/.config/scripts/kill.sh"
        " All Packages" "$HOME/.config/scripts/allpkglist.sh"
        " Installed Fonts" "$HOME/.config/scripts/fonts.sh"
         )

run_rofi() {
    for ((i = 0; i < ${#options[@]}; i += 2)); do
        echo "${options[i]}"
    done | rofi_cmd
}

selection=$(run_rofi)

for ((i = 0; i < ${#options[@]}; i += 2)); do
    if [[ "$selection" == "${options[i]}" ]]; then
        "${options[i+1]}"
        break
    fi
done
