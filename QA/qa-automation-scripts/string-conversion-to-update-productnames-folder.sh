#!/bin/bash

# Function to perform replacements and update the original file
process_file() {
  local input_file="$1"
  local temp_file
  temp_file=$(mktemp)

  # Use sed to perform the replacements and save the result to the temporary file
  sed -e 's/Xandr Invest/Microsoft Invest/g' -e 's/Xandr Monetize/Microsoft Monetize/g' -e 's/Xandr Curate/Microsoft Curate/g' "$input_file" > "$temp_file"

  # Check if the sed command was successful
  if [ $? -eq 0 ]; then
    # Replace the original file with the temporary file
    mv "$temp_file" "$input_file"
    echo "Replacements complete for $input_file"
  else
    echo "Replacements failed for $input_file"
    # Remove the temporary file
    rm "$temp_file"
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

echo "Replacements complete for all files in $1."
echo
