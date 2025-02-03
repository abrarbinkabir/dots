#!/bin/bash

# Paths
mp3_dir="$HOME/Documents/130-media/137-muaiqly"
titles_file="$HOME/Downloads/filenames.txt"

# Check if directory and file exist
if [[ ! -d "$mp3_dir" ]]; then
    echo "MP3 directory not found: $mp3_dir"
    exit 1
fi

if [[ ! -f "$titles_file" ]]; then
    echo "Titles file not found: $titles_file"
    exit 1
fi

# Read titles into an array
mapfile -t titles < "$titles_file"

# Get all MP3 files in the directory (sorted alphabetically)
mp3_files=("$mp3_dir"/*.mp3)

# Check if counts match
if [[ ${#titles[@]} -ne ${#mp3_files[@]} ]]; then
    echo "Mismatch between the number of titles and MP3 files."
    echo "Titles: ${#titles[@]}, MP3 Files: ${#mp3_files[@]}"
    exit 1
fi

# Loop through MP3 files and apply titles and filenames
for i in "${!mp3_files[@]}"; do
    mp3_file="${mp3_files[$i]}"
    new_title="${titles[$i]}"
    new_filename="$mp3_dir/${new_title}.mp3"

    # Update MP3 title tag
    echo "Updating title for: $mp3_file -> $new_title" &&
    eyeD3 --title="$new_title" "$mp3_file"
    # Rename the MP3 file
    echo "Renaming file: $mp3_file -> $new_filename" &&
    mv "$mp3_file" "$new_filename"
    echo
done

echo "All titles updated and files renamed successfully!"
