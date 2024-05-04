#!/bin/sh
feh --bg-scale ~/.config/wallpaper.png &
setxkbmap -layout us,bd ,probhat -option grp:toggle &
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
clipmenud &
