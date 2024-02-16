#!/bin/bash

# Function to process a file and remove the pattern
process_file() {
    local input_file="$1"
    local temp_file
    temp_file=$(mktemp)

    # Use sed to remove the pattern from the input file and save the result to the temporary file
    sed '/<div id=/d' "$input_file" > "$temp_file" && mv "$temp_file" "$input_file"
}

# Check if a folder was provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <folder>"
    exit 1
fi

# Check if the specified folder exists
if [ ! -d "$1" ]; then
    echo "Folder not found: $1"
    exit 1
fi

# Use 'find' to locate all files within the specified folder and its subdirectories
find "$1" -type f -print0 | while IFS= read -r -d '' file; do
    # Check if the file contains the pattern "<div id="
    if grep -q "<div id=" "$file"; then
        process_file "$file"
        echo "Pattern removed from $file"
    fi
done

echo "Pattern removal complete."
