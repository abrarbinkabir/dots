#!/bin/bash

# Get the current day of the week
day=$(date +%A)

# Check if today is Friday
if [ "$day" = "Monday" ]; then
    # Display the reminder message
    alacritty --class float_term -e sh -c "echo 'Dont forget to check your to-dos!' ; read -p 'Press ENTER to exit.'"
fi

from libqtile import hook
from libqtile.config import Key, Match
from libqtile.lazy import lazy

# Define a key binding to toggle floating mode
keys = [
    # Other key bindings...
    Key([], "f", lazy.window.toggle_floating()),
]

@hook.subscribe.client_new
def floating_dialogs(window):
    # Check if the window class is 'floating'
    if window.window.get_wm_class()[0] == "floating":
        # Set the window to floating
        window.floating = True
        # Set specific dimensions (adjust as needed)
        window.width = 800
        window.height = 600

# Define groups, layouts, and other configurations...
