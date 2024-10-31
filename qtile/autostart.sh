#!/bin/bash

feh --bg-scale ~/dots/images/wallpaper.png &
setxkbmap -layout us,bd,bd ,,probhat -option grp:caps_toggle &
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/bin/bash /home/abrar/.config/scripts/startup-msg.sh &
