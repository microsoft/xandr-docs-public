#!/bin/bash

# Check if directory is provided as argument
if [ $# -eq 0 ]; then
    echo "Please provide the directory as an argument."
    exit 1
fi

# Directory where your files are located
dir="$1"

# Check if directory exists
if [ ! -d "$dir" ]; then
    echo "The provided directory does not exist."
    exit 1
fi

# Loop over all files in the directory
for file in "$dir"/*
do
    # Create a new file with .new extension
    new_file="${file}.new"

    # Read the file line by line
    while IFS= read -r line
    do
        # Write the line to the new file
        echo "$line" >> "$new_file"

        # If the line contains "Description", add the new line after it
        if [[ "$line" == *"Description :"* ]]; then
            echo "ms.custom: digital-platform-api" >> "$new_file"
        fi
    done < "$file"

    # Replace the original file with the new file
    mv "$new_file" "$file"
done

echo "All files in the directory have been updated."
echo
