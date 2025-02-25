#!/usr/bin/env bash

# Configuration variables
theme="$HOME/.config/rofi/applet-config.rasi"
message="Date and Time"

# Define options
options=(
    " Now: $(date '+%I:%M %p')"
    " Today: $(date '+%B %d, %Y')"
    " Weekday: $(date '+%A')"
    " Week No: $(date '+%U')"
    " HDate: $(idate --simple | awk -F' - ' '{print $1}')"
    " Hmonth: $(idate --simple | awk -F' - ' '{print $3}')"


)

# Rofi command function
rofi_cmd() {
    rofi -theme-str 'listview {columns: 1; lines: 6;}' \
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
