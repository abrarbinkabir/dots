#!/bin/bash

# Define the directories and files to link as a space-separated array
directories=("alacritty" "bat" "betterlockscreen" "btop" "dunst" "fontconfig" "gtk-3.0" "kitty" "lf" "mpd" "mpv" "nsxiv" "nvim" "pandoc" "qtile" "qutebrowser" "redshift" "restic" "rofi" "scripts" "systemd" "yt-dlp" "zathura" "zoxide" "zsh")

# Loop through each config and create symbolic links
for dir in "${directories[@]}"; do
    ln -sf "$HOME/dots/$dir" "$HOME/.config/"
done

# Additional specific links
ln -sf "$HOME/dots/zsh/zshrc" "$HOME/dots/zsh/.zshrc"
ln -sf "$HOME/dots/zshenv" "$HOME/.zshenv"
ln -sf "$HOME/dots/vimrc" "$HOME/.vimrc"
ln -sf "$HOME/dots/gtkrc-2.0" "$HOME/.gtkrc-2.0"
ln -sf "$HOME/dots/applications" "$HOME/.local/share/"
ln -sf "$HOME/dots/mimeapps.list" "$HOME/.config/mimeapps.list"
