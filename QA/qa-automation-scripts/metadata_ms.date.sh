#!/bin/bash

# Check if directory is provided as argument
input_directory="$1"

# Directory where your files are located
dir="$input_directory"

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
            echo "ms.date: 10/28/2023" >> "$new_file"
        fi
    done < "$file"

    # Replace the original file with the new file
    mv "$new_file" "$file"
done

echo "All files in the directory have been updated."
echo
