#!/bin/bash

# Function to process a file and remove lines containing "**Parent topic:**"
process_file() {
    local input_file="$1"
    local temp_file
    temp_file=$(mktemp)

    # Use sed to remove lines containing "**Parent topic:**" and save the result to the temporary file
    sed '/\*\*Parent topic:\*\*/d' "$input_file" > "$temp_file"

    # Check if the sed command was successful
    if [ $? -eq 0 ]; then
        # Overwrite the original file with the contents of the temporary file
        mv "$temp_file" "$input_file"
        echo "Changes applied to $input_file"
    else
        echo "Failed to apply changes to $input_file"
        # Clean up the temporary file
        rm -f "$temp_file"
    fi
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
    process_file "$file"
done

echo "Changes applied to all files in $1."
echo
