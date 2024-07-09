#!/bin/bash

# Function to find images in a directory
find_images() {
    local dir="$1"
    find "$dir" -maxdepth 1 \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tif" -o -iname "*.tiff" \) -type f
}

# Check if the argument is a directory or a file
if [ -d "$1" ]; then
    # If the argument is a directory, open all images in the directory
    mapfile -t images < <(find_images "$1")
    if [ ${#images[@]} -gt 0 ]; then
        nsxiv "${images[@]}"
    else
        echo "No images found in directory: $1"
    fi
elif [ -f "$1" ]; then
    # If the argument is a file, open all images in its parent directory
    parent_dir=$(dirname "$1")
    mapfile -t images < <(find_images "$parent_dir")

    # Sort images array based on modification time
    mapfile -t sorted_images < <(stat -c "%Y %n" "${images[@]}" | sort -n | cut -d ' ' -f 2-)

    # Find the index of the selected image
    selected_index=-1
    for i in "${!sorted_images[@]}"; do
        if [[ "${sorted_images[$i]}" == "$1" ]]; then
            selected_index=$i
            break
        fi
    done

    if [ "$selected_index" -ge 0 ]; then
        # Open all images starting from the selected image
        nsxiv --no-bar -n "$((selected_index + 1))" "${sorted_images[@]}"
    else
        echo "Selected file not found in directory: $parent_dir"
    fi
else
    echo "Usage: $0 <directory or image>"
fi

