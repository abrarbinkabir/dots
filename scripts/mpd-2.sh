#!/bin/bash

# Configuration variables
theme="$HOME/.config/rofi/applet-config.rasi"
message="Currently Playing"

# Define options with icons and labels
options=(
    " Title: $(mpc current -f '%title%')"
    " Artist: $(mpc current -f '%artist%')"
    " Album: $(mpc current -f '%album%')"
    " Duration: $(mpc current -f '%time%') min"
)

# Rofi command function
rofi_cmd() {
    rofi -theme-str 'window { width: 500px;}' \
        -theme-str 'listview {columns: 1; lines: 4;}' \
        -dmenu \
        -mesg "$message" \
        -markup-rows \
        -theme "$theme"
}

# Main function
main() {
    # Run Rofi with options
    printf "%s\n" "${options[@]}" | rofi_cmd > /dev/null 2>&1
}

# Call the main function
main
