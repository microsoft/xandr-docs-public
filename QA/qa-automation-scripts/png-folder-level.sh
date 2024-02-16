#!/bin/bash

# Check if the user provided a folder path as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <folder_path>"
    exit 1
fi

folder_path="$1"

# Check if the folder path exists
if [ ! -d "$folder_path" ]; then
    echo "Folder does not exist: $folder_path"
    exit 1
fi

# Recursive function to convert file extensions
convert_to_png() {
    local folder="$1"

    # Loop through files in the folder
    for file in "$folder"/*; do
        if [ -d "$file" ]; then
            # If it's a subdirectory, call the function recursively
            convert_to_png "$file"
        elif [ -f "$file" ]; then
            # If it's a file, check its extension
            filename=$(basename "$file")
            extension="${filename##*.}"

            if [ "$extension" != "png" ]; then
                # Convert non-.png extensions to .png
                new_filename="${filename%.*}.png"
                new_path="$folder/$new_filename"

                mv "$file" "$new_path"
                echo "Renamed: $file -> $new_path"
            fi
        fi
    done
}

# Start the conversion process
convert_to_png "$folder_path"

echo "Conversion complete!"
