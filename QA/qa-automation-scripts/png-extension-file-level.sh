#!/bin/bash

# Check if a directory path is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Directory path provided as an argument
directory="$1"

# Check if the provided directory exists
if [ ! -d "$directory" ]; then
    echo "Directory not found: $directory"
    exit 1
fi

# Use find to locate all Markdown files in the directory and its subdirectories
find "$directory" -type f -name "*.md" | while read -r file; do
    # Create a temporary file
    temp_file=$(mktemp)

    # Use sed to replace patterns within each Markdown file and save changes to the temporary file
    #sed -e 's|<img src="\([^"]*/\)\(.*\)"|<img src="media/\2"|g' -e 's|\.jpg"|\.png"|g' "$file" > "$temp_file"
    sed -e 's|<img src="\([^"]*/\)\(.*\)\.jpg"|<img src="media/\2\.png"|g' -e 's|<img src="\([^"]*/\)\(.*\)\.jpeg"|<img src="media/\2\.png"|g' "$file" > "$temp_file"

    # Replace the original file with the temporary file
    mv "$temp_file" "$file"
    echo "Updated: $file"
done

echo "Pattern replacement and extension conversion completed."
echo
