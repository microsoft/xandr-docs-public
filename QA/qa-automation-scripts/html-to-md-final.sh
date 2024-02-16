#!/bin/bash

input_directory="$1"
folder="$input_directory"

# Recursive function to process files in the folder
process_files() {
    local folder="$1"
    for file in "$folder"/*; do
        if [ -d "$file" ]; then
            process_files "$file"
        elif [ -f "$file" ]; then
            process_file "$file"
        fi
    done
}

# Function to process individual files
process_file() {
    local file="$1"
    local tmpfile="$(mktemp "${TMPDIR:-/tmp}/tempfile.XXXXXXXXXX")"

    # Use sed to modify the file
    sed 's/\(a href=".*\)\.html"/\1.md"/g' "$file" > "$tmpfile"

    # Replace the original file with the modified temp file
    mv "$tmpfile" "$file"
}

# Start processing files
process_files "$folder"

echo "Conversion completed."
echo
