#!/bin/bash

# Specifies Theme
theme="$HOME/.config/rofi/applet-config.rasi"
message="Restic Backup"

options=("Backup in nvme0n1p2" "Backup in team-c175")
directories=("/mnt/nvme0n1p2" "/run/media/abrar/team-c175")

# Rofi command function
rofi_cmd() {
    rofi -theme-str 'listview {columns: 1; lines: 2;}' \
        -dmenu \
        -mesg "$message" \
        -markup-rows \
        -theme "$theme"
}

backup() {
    cd "$dir" || { echo "Directory $dir not found"; exit 1; }
    restic -r . backup \
        --files-from="$HOME/.config/restic/include.txt" \
        --exclude-file="$HOME/.config/restic/exclude.txt"  &&
    restic -r . unlock &&
    restic -r . forget \
        --keep-last 3 \
        --prune &&
    notify-send -u normal -a Restic -i bell "Snapshot created successfully"
}

# Main function  
main() {
    # Run Rofi with options
    selection=$(printf "%s\n" "${options[@]}" | rofi_cmd)
    case $selection in
        "${options[1]}")
            dir="${directories[1]}"
            if [ ! -d "$dir" ]; then
                udisksctl mount -b /dev/sdb1 > /dev/null 2>&1 || {
                    notify-send -u normal -a Restic -i bell "Please insert USB drive"
                    exit 1
                }
            fi
            backup
            ;;
        "${options[0]}")
            dir="${directories[0]}"
            backup
            ;;
    esac
}

# Call the main function
main
	
