#!/bin/bash

# Theme configuration file for rofi
theme="$HOME/.config/rofi/config.rasi"

# Function to execute the rofi command with desired options
rofi_cmd() {
		rofi -theme-str "window {width:800px;}" \
		-dmenu -i \
		-p "Packages" \
		-sort \
		-sorting-method fzf \
		-markup-rows \
		-theme "$theme"
		}

# Main function
main(){
    # Display the package list in rofi and capture the selected package
	 selection=$(pacman -Sl | cut -d ' ' -f 2,4 | rofi_cmd)
	
    # If a package is selected, display its details using alacritty
    if [ -n "$selection" ]; then
    	package=$(echo "$selection" | cut -d ' ' -f 1)
        alacritty -e sh -c "pacman -Si \"$package\" ; read -p 'Press ENTER to exit'"
    fi
}

# Execute the main function
main

