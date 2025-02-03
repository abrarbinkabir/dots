#!/bin/bash

if pgrep -x "wlsunset" > /dev/null
then
    pkill -x "wlsunset" &&
    notify-send -u normal -a Nightlight -i nightlight-off "Stopped nightlight"
else
    wlsunset -t 4750 -T 6500 -S 5:35 -s 16:55 -d 300 -g 0.9 &
    notify-send -u normal -a Nightlight -i nightlight-on "Started nightlight"

fi
