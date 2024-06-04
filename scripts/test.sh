#!/bin/bash

echo "Updating system packages"
sudo pacman -Sy --no-confirm &&
echo "Upgrading packages"
sudo pacman -Su &&
echo "Showing all installed packages"
pacman -Qe
exit
