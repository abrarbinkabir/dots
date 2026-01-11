#!/usr/bin/env bash

# Specifies theme
theme="$HOME/.config/rofi/applet-config.rasi"
message="Backup" 
dt="$(date +%Y%m%d)"
source /home/abrar/.config/restic/passwd

# Defines options
options=(" Backup in team-c175" " Pacman Package List" " Push Dotfiles Repo")
dir="/run/media/abrar/team-c175"

# Rofi CMD
rofi_cmd() {
   rofi -theme-str 'listview {columns: 1; lines: 3;}' \
		-dmenu \
		-mesg "$message" \
		-markup-rows \
		-theme "$theme"
}

backup() {
    cd "$dir" || { 
        echo "Directory $dir not found"; 
        notify-send -u critical -a Restic -i backup "Backup failed: directory not found"
        exit 1
    }

    # Clear stale locks
    restic -r . unlock >/dev/null 2>&1

    # Run backup
    if ! restic -r . backup \
        --files-from="$HOME/.config/restic/include.txt" \
        --exclude-file="$HOME/.config/restic/exclude.txt"; then
        notify-send -u critical -a Restic -i backup "Failed during backup step"
        return 1
    fi

    # Run forget + prune
    if ! restic -r . forget \
        --keep-weekly 4 \
        --keep-monthly 12 \
        --prune; then
        notify-send -u critical -a Restic -i backup "Failed during prune step"
        return 1
    fi

    # Success
    notify-send -u normal -a Restic -i backup -t 0 "Backup on team-c175 successful"
}


# Main function  
main() {
    # Run Rofi with options
    selection=$(printf "%s\n" "${options[@]}" | rofi_cmd)
    case $selection in
         "${options[0]}")
            if [ ! -d "$dir" ]; then
                udisksctl mount -b /dev/sdb1 > /dev/null 2>&1 || {
                    notify-send -u normal -a Restic -i usb "Please insert USB drive"
                    exit 1
                }
            fi
            backup > ~/dots/misc/backup-logs 2>&1
            ;;
        "${options[1]}")
            pacman -Qen > "$HOME/dots/misc/npkglist-${dt}.md" &&
            find "$HOME/dots/misc/" -type f -iname 'npkglist*' -exec ls -r {} + | tail -n +4 | xargs -I {} mv {} ~/.local/share/Trash/files/ &&
            pacman -Qem > "$HOME/dots/misc/fpkglist-${dt}.md" &&
            find "$HOME/dots/misc/" -type f -iname 'fpkglist*' -exec ls -r {} + | tail -n +4 | xargs -I {} mv {} ~/.local/share/Trash/files/
            if [ $? -eq 0 ] ; then
                notify-send -u normal -a "Package List" -i pacman -t 3000 "Backup successful!"
            else
                notify-send -u critical -a "Package List" -i pacman -t 3000 "Backup unsuccessful!"
            fi
            ;;
	  "${options[2]}")
            cd "$HOME/dots" && 
            git add -A && git commit -m "Minor changes" 
            git push origin main

        if [ $? -eq 0 ] ; then
            notify-send -u normal -a "Dotfiles" -i github -t 3000 "Pushed successfully!"
        else
            notify-send -u critical -a "Dotfiles" -i github -t 3000 "Push unsuccessful!"
        fi
        ;;
    esac
}

# Call the main function
main

