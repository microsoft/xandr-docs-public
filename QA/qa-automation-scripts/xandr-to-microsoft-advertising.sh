#!/bin/bash

# Check if folder argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <folder>"
    exit 1
fi

folder="$1"

# Iterate through files in the folder
for file in "$folder"/*; do
    # Check if file is a regular file
    if [ -f "$file" ]; then
        # Create a temporary file
        temp_file=$(mktemp)

        # Replace "Xandr" with "Microsoft Advertising" using sed and save the result in the temporary file
        sed 's/Xandr/Microsoft Advertising/g' "$file" > "$temp_file"

        # Overwrite the original file with the contents of the temporary file
        mv "$temp_file" "$file"
    fi
done
echo

