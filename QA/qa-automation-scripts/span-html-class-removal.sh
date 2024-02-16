#!/bin/bash

# Input directory provided as a command line argument
input_dir="$1"

# Check if input directory exists
if [ ! -d "$input_dir" ]; then
    echo "Input directory does not exist: $input_dir"
    exit 1
fi

# Function to remove <span>, <span class="ph">, and </span> tags from a file and update the original file
remove_span_tags() {
    for input_file in "$@"; do
        # Create a temporary file
        temp_file="${input_file}.temp"

        # Use sed to remove <span>, <span class="ph">, and </span> tags from the file and save it to the temporary file
        sed 's/<span>//g; s/<\/span>//g; s/<span class="ph">//g; s/<\/span>//g' "$input_file" > "$temp_file"

        # Replace the original file with the modified file
        mv "$temp_file" "$input_file"

        echo "Removed <span>, <span class=\"ph\">, and </span> tags from: $input_file"
    done
}

export -f remove_span_tags

# Recursively find and remove tags in files
find "$input_dir" -type f -exec bash -c 'remove_span_tags "$0"' {} \;
echo
