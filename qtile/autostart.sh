#!/bin/sh
feh --bg-scale ~/dots/images/wallpaper.png &
setxkbmap -layout us,bd ,probhat -option grp:toggle &
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
