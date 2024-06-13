#!/bin/bash

# Check if the argument is a directory or a file
if [ -d "$1" ]; then
    # If the argument is a directory, open all images in the directory
    nsxiv "$1"/*
elif [ -f "$1" ]; then
    # If the argument is a file, open all images in its parent directory
    parent_dir=$(dirname "$1")
    # Get all images in the same directory as the selected image
    images=($(find "$parent_dir" -maxdepth 1 -type f -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tif" -o -iname "*.tiff"))
    # Sort images array based on modification time
    sorted_images=($(stat -c "%Y %n" "${images[@]}" | sort -n | cut -d ' ' -f 2-))
    # Find the index of the selected image
    selected_index=-1
    for i in "${!sorted_images[@]}"; do
        if [[ "${sorted_images[$i]}" == "$1" ]]; then
            selected_index=$i
            break
        fi
    done
    if [ $selected_index -ge 0 ]; then
        # Open all images starting from the selected image
        nsxiv -n "$((selected_index + 1))" "${sorted_images[@]}"
    else
        echo "Selected file not found in directory"
    fi
else
    echo "Usage: $0 <directory or image>"
fi
