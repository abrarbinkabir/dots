#!/bin/bash

# Check if the number of arguments is correct
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

directory="$1"

# Check if the specified directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist."
    exit 1
fi

# Move into the specified directory
cd "$directory" || exit

# Loop through all files in the directory
for file in *; do
    # Check if the file name is already lowercase
    if [[ "$file" != "${file,,}" ]]; then
        # Rename the file to lowercase
        mv "$file" "${file,,}"
        echo "Renamed $file to ${file,,}"
    fi
done
