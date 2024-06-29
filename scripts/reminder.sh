#!/bin/bash

# Get the current day of the week
day=$(date +%A)

# Check if today is Friday
if [ "$day" = "Monday" ]; then
    # Display the reminder message
    alacritty --class float_term -e sh -c "echo 'Dont forget to check your to-dos!' ; read -p 'Press ENTER to exit.'"
fi
