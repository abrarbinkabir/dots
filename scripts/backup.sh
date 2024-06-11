#!/usr/bin/env bash

# Specifies theme
theme="$HOME/.config/rofi/applet-config.rasi"
message="Backup" 
dt="$(date +%Y%m%d)"
source "$HOME/.config/restic/passwd-file"

# Defines options
options=(" Backup in nvme0n1p2" " Backup in team-c175" " Pacman Package List" " Push Dotfiles Repo")
directories=("/mnt/nvme0n1p2" "/run/media/abrar/team-c175")

# Rofi CMD
rofi_cmd() {
   rofi -theme-str 'listview {columns: 1; lines: 4;}' \
		-dmenu \
		-mesg "$message" \
		-markup-rows \
		-theme "$theme"
}

backup() {
    cd "$dir" || { echo "Directory $dir not found"; exit 1; }
    restic -r . backup \
        --files-from="$HOME/.config/restic/include.txt" \
        --exclude-file="$HOME/.config/restic/exclude.txt" \ &&
    restic -r . unlock &&
    restic -r . forget \
        --keep-last 3 \
        --prune &&
    notify-send -u normal -a Restic -i bell "Backup successful"
}

# Main function  
main() {
    # Run Rofi with options
    selection=$(printf "%s\n" "${options[@]}" | rofi_cmd)
    case $selection in
         "${options[0]}")
            dir="${directories[0]}"
            backup > .scriptlogs 2>&1
            ;;
        "${options[1]}")
            dir="${directories[1]}"
            if [ ! -d "$dir" ]; then
                udisksctl mount -b /dev/sdb1 > /dev/null 2>&1 || {
                    notify-send -u normal -a Restic -i bell "Please insert USB drive"
                    exit 1
                }
            fi
            backup > .scriptlogs 2>&1
            ;;
        "${options[2]}")
            pacman -Qen > "$HOME/dots/misc/npkglist-${dt}.md" &&
            find "$HOME/dots/misc/" -type f -iname 'npkglist*' -exec ls -r {} + | tail -n +4 | xargs -I {} mv {} ~/.local/share/Trash/files/ &&
            pacman -Qem > "$HOME/dots/misc/fpkglist-${dt}.md" &&
            find "$HOME/dots/misc/" -type f -iname 'fpkglist*' -exec ls -r {} + | tail -n +4 | xargs -I {} mv {} ~/.local/share/Trash/files/
            if [ $? -eq 0 ] ; then
                notify-send -u normal -a "Package List" -i bell -t 3000 "Backup successful!"
            else
                notify-send -u critical -a "Package List" -i bell -t 3000 "Backup unsuccessful!"
            fi
            ;;
	  "${options[3]}")
            cd "$HOME/dots" && git add -A && git commit -m "Minor changes" && git push origin main
        if [ $? -eq 0 ] ; then
            notify-send -u normal -a "Dotfiles" -i bell -t 3000 "Pushed successfully!"
        else
            notify-send -u critical -a "Dotfiles" -i bell -t 3000 "Push unsuccessful!"
        fi
        ;;
    esac
}

# Call the main function
main

