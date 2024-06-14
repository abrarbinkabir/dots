#!/bin/bash

# Define the folder path to search for videos
dir_path="$HOME/nsync/ytdlp/"

# Search for video files in the specified folder
videos=$(find "$dir_path" -type f \( -iname "*.mp4" -o -iname "*.avi" -o -iname "*.mkv" \))

# Check if any videos were found
if [ -z "$videos" ]; then
    echo "No videos found in $dir_path"
    exit 1
fi

# Convert the list of videos into an array
IFS=$'\n' read -r -d '' -a video_array <<< "$videos"

# Create a Rofi menu with the list of videos
selected_video=$(printf "%s\n" "${video_array[@]}" | rofi -dmenu -p "Select a video:")

# Check if a video was selected
if [ -n "$selected_video" ]; then
    # Play the selected video using your preferred video player
    # Replace 'mpv' with your preferred video player
    mpv "$selected_video"
else
    echo "No video selected."
fi
