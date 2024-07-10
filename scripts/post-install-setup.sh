#!/bin/bash

main() {
    echo "Copying fonts to $HOME/.local/share/fonts..."
    mkdir -p ~/.local/share/fonts/ &&
    cp -Tr "$HOME/dots/fonts/" "$HOME/.local/share/fonts/"
    if [ $? -eq 0 ]; then
        echo "Fonts copied successfully!"
    else
        echo "Error: Something went wrong while copying fonts."
    fi

    echo "Creating symlinks in ~/.config folder..."
    mkdir -p "$HOME/.config" &&
    bash "$HOME/dots/symlink.sh"
    if [ $? -eq 0 ]; then
        echo "Symlinks created successfully!"
    else
        echo "Error: Something went wrong while creating symlinks."
    fi

    echo "Installing native Arch packages..."
    # Find the latest npkglist file and install its first listed package with pacman
    latest_npkglist=$(find "$HOME/dots/misc" -type f -iname "npkglist*" -exec ls -t -1 {} + | head -n 1) &&
    sudo pacman -S "$(cut -d " " -f 1 < "$latest_npkglist")"
    if [ $? -eq 0 ]; then
        echo "Native packages installed successfully!"
    else
        echo "Error: Something went wrong while installing native packages."
    fi

    echo "Installing yay..."
    # Clone yay from AUR and install it
    git clone "https://aur.archlinux.org/yay.git" "$HOME/yay" &&
    cd "$HOME/yay" &&
    makepkg -si
    if [ $? -eq 0 ]; then
        echo "yay installed successfully!"
    else
        echo "Error: Something went wrong while installing yay."
    fi

    echo "Installing AUR packages..."
    # Find the latest fpkglist file and install its first listed package with yay
    latest_fpkglist=$(find "$HOME/dots/misc" -type f -iname "fpkglist*" -exec ls -t -1 {} + | head -n 1) &&
    yay -S "$(cut -d " " -f 1 < "$latest_fpkglist")"
    if [ $? -eq 0 ]; then
        echo "AUR packages installed successfully!"
    else
        echo "Error: Something went wrong while installing AUR packages."
    fi

    echo "Setting up Systemd services..."
    # Enable necessary systemd services
    sudo cp "$HOME/dots/misc/betterlockscreen@.service" /usr/lib/systemd/system/ &&
    sudo systemctl enable lightdm.service &&
    sudo systemctl enable betterlockscreen@"$USER".service &&
    systemctl --user enable syncthing.service &&
    systemctl --user enable mpd.service &&
    systemctl --user enable redshift.service &&
    systemctl --user enable clipmenud.service
    if [ $? -eq 0 ]; then
        echo "Services configured successfully!"
    else
        echo "Error: Something went wrong while setting up systemd services."
    fi

    echo "Setting up wallpapers..."
    feh --bg-scale "$HOME/dots/images/wallpaper.png" &&
    betterlockscreen -u "$HOME/dots/images/wallpaper.png"
    if [ $? -eq 0 ]; then
        echo "Wallpapers set successfully!"
    else
        echo "Error: Something went wrong while setting up wallpapers."
    fi

    echo "Updating databases..."
    sudo updatedb &&
    sudo mandb
    if [ $? -eq 0 ]; then
        echo "Database update completed successfully!"
    else
        echo "Error: Something went wrong while updating databases."
    fi
    
    echo "Creating necessary folders..."
    cd ~ &&
    mkdir -p Documents/git Downloads
    if [ $? -eq 0 ]; then
        echo "Folder creation completed successfully!"
    else
        echo "Error: Something went wrong while creating necessary folders."
    fi

    git clone "https://github.com/abrarbinkabir/startpage.git" "$HOME/Documents/git/" && 
    rm -rf yay &&
    echo "Setup completed successfully! Exiting..."
    exit
}

main
