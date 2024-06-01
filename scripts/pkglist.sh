#!/bin/bash

# Theme configuration file for rofi
theme="$HOME/.config/rofi/config.rasi"

# Function to execute the rofi command with desired options
rofi_cmd() {
		rofi -dmenu -i \
		-p "Packages" \
		-sort \
		-sorting-method fzf \		
		-markup-rows \
		-theme "$theme"
		}
		
# Get the list of explicitly installed native packages
packages=$(pacman -Qeq)

# Main function
main(){
    # Display the package list in rofi and capture the selected package
	selection=$(printf "%s\n" "$packages" | sort | rofi_cmd)
	
    # If a package is selected, display its details using alacritty
    if [ -n "$selection" ]; then
        alacritty -e sh -c "pacman -Qi \"$selection\" ; read -p 'Press ENTER to exit'"
    fi
}

# Execute the main function
main
