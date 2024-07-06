#!/bin/bash

# Define the folder path to search for videos
dir_path="$HOME/nsync/ytdlp"
selection=$(find "$dir_path" -type f -iname '*.mp4' | sort | cut -d '/' -f 6- | fzf --multi --reverse)
files=()

main() {
    # Loop through each selected file path in selection
    while IFS= read -r file_path; do
        # Add each file path to the files array
        files+=("$dir_path/$file_path")
    done <<< "$selection"
    
    mpv "${files[@]}"
    # echo "${files[@]}"
}

main
