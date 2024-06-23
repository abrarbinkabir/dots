#!/bin/bash

input_file="/home/abrar/Downloads/test.txt"

# Validate input file
if [ ! -f "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Read input file line by line
while IFS= read -r line; do
    # Extract chapter number (assuming it's the first word/number in the line)
    chapter=$(echo "$line" | awk -F'|' '{print $1}')

    # Create a file if it doesn't exist or append to existing file
    echo "$line" >> "surah_${chapter}.txt"
done < "$input_file"

echo "Splitting '$input_file' into separate chapter files completed."

