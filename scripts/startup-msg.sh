#!/bin/bash

day_today=$(date +%A)
date_today=$(date +%b' '%d', '%Y)
hour_now=$(date +%H)
hour_now=${hour_now#0} # remove leading zeros

sleep 3 &&
    notify-send -u normal -a Today -i calendar "${date_today} ($day_today)" &&
sleep 4

if [[ "$hour_now" -ge 6 && "$hour_now" -le 12 ]]; then
    notify-send -u normal -a Reminder -i reminder "Complete morning tasks" &&
    sleep 4
elif [[ "$hour_now" -gt 12 ]]; then
    notify-send -u normal -a Reminder -i reminder "Completed morning tasks?" &&
    sleep 4
fi

if [[ "$day_today" == "Friday" ]]; then
    notify-send -u normal -a Reminder -i reminder-alt1 -t 5000 "Complete weekly tasks" &&
    sleep 6
fi

if [[ "$date_today" == 01 ]]; then
    notify-send -u normal -a Reminder -i reminder-alt2 -t 5000 "Complete monthly tasks"
fi
