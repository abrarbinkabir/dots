#!/bin/bash

uptime_hrs=$(uptime -p | cut -d ' ' -f2)

if [[ "$uptime_hrs" -gt 6 ]]; then
    notify-send -u normal -a Alert -i alert "Uptime more than 7 hrs"
fi
