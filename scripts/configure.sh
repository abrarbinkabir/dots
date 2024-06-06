#!/bin/bash

if [ ! -d "$HOME/dots" ]; then
    echo "Dotfiles does not exist." &&
    echo "Navigating to $HOME" &&
    cd $HOME &&
    echo "Cloning Dotfiles repo into $HOME/dots" &&
    git clone "https://github.com/abrarbinkabir/dots.git" $HOME/dots &&
    echo "Copying fonts" &&
	mkdir ~/.local/share/fonts/ &&
	cp -Tr $HOME/dots/fonts/ $HOME/.local/share/fonts &&
	echo "Creating symlinks" &&
	rm -rf $HOME/.config/qtile &&
	./$HOME/dots/symlink.sh
else 
	echo "Dotfiles exists."
fi
main(){
	echo "Installing native packages" &&
	sudo pacman -S $(cat $(find ~/dots/misc -type f -iname "npkglist*" -exec ls -t -1 {} + | head -n 1) | cut -d " " -f 1) &&
	echo "installing yay" &&
	git clone "https://aur.archlinux.org/yay.git" $HOME/yay && cd $HOME/yay && makepkg -si &&
	echo "Installing AUR packages" &&
	yay -S $(cat $(find $HOME/dots/misc -type f -iname "fpkglist*" -exec ls -t -1 {} + | head -n 1) | cut -d " " -f 1) &&
	sudo cp $HOME/dots/misc/betterlockscreen@.service /usr/lib/systemd/system/ &&
	sudo systemctl enable lightdm.service &&
	sudo systemctl enable betterlockscreen@$USER.service &&
	systemctl enable --user syncthing@$USER.service &&
	systemctl enable --user mpd.service &&
	systemctl enable --user redshift.service &&
	systemctl enable --user clipmenud.service &&
	betterlockscreen -u $HOME/dots/images/wallpaper.png &&
	updatedb &&
	sudo mandb &&
	echo "Successful!"
	exit
	}
main
