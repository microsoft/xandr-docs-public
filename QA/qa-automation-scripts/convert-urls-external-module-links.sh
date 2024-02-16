#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Iterate through each markdown file in the directory
for file in "$1"/*.md; do
    if [ -f "$file" ]; then
        echo "Converting URLs in $file"

        # Create a temporary file to store the updated content
        tmpfile=$(mktemp)

        # Read the input file line by line
        while IFS= read -r line; do
            new_line=$(echo "$line" | sed -E 's|https://docs.xandr.com/bundle/([^/]+)/page/topics/([^)]+)\.html|\1/\2.md|g')
            new_line=$(echo "$new_line" | sed -E 's|https://docs.xandr.com/bundle/(.*)/page/(.*)\.html|\1/\2.md|g')

            # If no URL replacement was made, keep the original line
            if [ "$new_line" == "$line" ]; then
                echo "$line" >> "$tmpfile"
            else
                echo "$new_line" >> "$tmpfile"
            fi
        done < "$file"

        # Replace the original file with the updated content
        mv "$tmpfile" "$file"

        echo "Done"
    fi
done
echo
