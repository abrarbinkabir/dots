#!/bin/bash

# Path to the bookmarks file (modify this as needed)
bookmarks_file="$HOME/dots/qutebrowser/bookmarks/urls"

# Import Current Theme
theme="$HOME/.config/rofi/config-4.rasi"

# Rofi CMD
rofi_cmd() {
    rofi -theme-str "entry {placeholder: 'Search bookmarks...';}" \
        -dmenu -i \
        -sort \
        -sorting-method fzf \
        -markup-rows \
        -theme ${theme}
}

# Read bookmarks from the file and prepare options
prepare_options() {
    if [[ ! -f "$bookmarks_file" ]]; then
        echo "Bookmarks file not found at $bookmarks_file" >&2
        exit 1
    fi

    awk '{print $2}' "$bookmarks_file"
}

# Get the URL corresponding to the selected bookmark
get_url() {
    local selected_name="$1"
    grep "$selected_name" "$bookmarks_file" | awk '{print $1}'
}

# Actions
run_rofi() {
    prepare_options | rofi_cmd
}

run_cmd() {
    local selected_name="$1"
    local url=$(get_url "$selected_name")

    if [[ -n "$url" ]]; then
        xdg-open "$url"
        hyprctl dispatch focuswindow class:firefox
    else
        echo "No URL found for the selected bookmark: $selected_name" >&2
    fi
}

# Main Logic
chosen=$(run_rofi)
if [[ -n "$chosen" ]]; then
    run_cmd "$chosen"
fi
