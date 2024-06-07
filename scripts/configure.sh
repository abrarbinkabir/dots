#!/bin/bash

main(){
	echo "Copying fonts to $HOME/.local/share/fonts" &&
	mkdir -p ~/.local/share/fonts/ &&
	cp -Tr $HOME/dots/fonts/ $HOME/.local/share/fonts &&
	echo "Creating symlinks" &&
	mkdir $HOME/.config &&
	bash $HOME/dots/symlink.sh &&
	echo "Installing native packages" &&
	sudo pacman -S $(cat $(find ~/dots/misc -type f -iname "npkglist*" -exec ls -t -1 {} + | head -n 1) | cut -d " " -f 1) &&
	echo "installing yay" &&
	git clone "https://aur.archlinux.org/yay.git" $HOME/yay && cd $HOME/yay && makepkg -si &&
	echo "Installing AUR packages" &&
	yay -S $(cat $(find $HOME/dots/misc -type f -iname "fpkglist*" -exec ls -t -1 {} + | head -n 1) | cut -d " " -f 1) &&
	sudo cp $HOME/dots/misc/betterlockscreen@.service /usr/lib/systemd/system/ &&
	sudo systemctl enable lightdm.service &&
	sudo systemctl enable betterlockscreen@$USER.service &&
	systemctl enable --user syncthing.service &&
	systemctl enable --user mpd.service &&
	systemctl enable --user redshift.service &&
	systemctl enable --user clipmenud.service &&
	betterlockscreen -u $HOME/dots/images/wallpaper.png &&
	sudo updatedb &&
	sudo mandb &&
	echo "Successful!"
	exit
	}
main
