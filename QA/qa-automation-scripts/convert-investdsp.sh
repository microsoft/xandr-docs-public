#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <folder>"
    exit 1
fi

folder="$1"

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
    sed 's/Invest DSP/Microsoft Invest/g' "$file" > "$tmpfile"

    # Replace the original file with the modified temp file
    mv "$tmpfile" "$file"
}

# Start processing files
process_files "$folder"

echo "Conversion completed."
