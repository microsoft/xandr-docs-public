#!/bin/bash

# Check if an input folder is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <input_folder>"
    exit 1
fi

# Assign input folder from command-line parameter
input_folder="$1"

# Log file path
log_file="master_script.log"

# Function to log messages
log_message() {
    local timestamp
    timestamp=$(date +"%Y-%m-%d %T")
    echo "[$timestamp] $1" >> "$log_file"
}

# Create or clear the log file
> "$log_file"

log_message "Starting master script with input folder: $input_folder"

# Call the first script with the input folder
log_message "Calling script1.sh: Converting docs portal current link to its corresponding MD file within its respective docset folder"
./convert-urls-external-module-links.sh "$input_folder" >> "$log_file" 2>&1

# Call the second script with the input folder
log_message "Calling script2.sh: Appending slug values to the file-level metadata for the ms.date tag in all markdown files"
./metadata_ms.date.sh "$input_folder" >> "$log_file" 2>&1

# Call the third script with the input folder
log_message "Calling script3.sh: Appending slug values to the file-level metadata for the ms.custom tag in all developer documentation"
./metadata_filelevel_ms.cusom.sh "$input_folder" >> "$log_file" 2>&1

# Call the fourth script with the input folder
log_message "Calling script4.sh: Addressing broken link extension for files, extension needs to be converted from .html to .md"
./html-to-md-final.sh "$input_folder" >> "$log_file" 2>&1

# Call the fifth script with the input folder
log_message "Calling script5.sh: Converting all images within the file to the .png extension and routing all image links to media folder"
./png-extension-file-level.sh "$input_folder" >> "$log_file" 2>&1

# Call the sixth script with the input folder
log_message "Calling script6.sh: Addressing junk html values and removing all <span> and <span class> elements"
./span-html-class-removal.sh "$input_folder" >> "$log_file" 2>&1

# Call the seventh script with the input folder
log_message "Calling script7.sh: Addressing the string conversion: Xandr Invest to Microsoft Invest, Xandr Monetize to Microsoft Monetize and Xandr Curate to Microsoft Curate"
./string-conversion-to-update-productnames-folder.sh "$input_folder" >> "$log_file" 2>&1

# Call the eight script with the input folder
log_message "Calling script8.sh: Formatting of all “Note/Warning/Important/Tip” elements and add <b> bold tags as appropriate"
./add-boldtags-to-tips-note-elements-folder.sh "$input_folder" >> "$log_file" 2>&1

# Call the ninth script with the input folder
log_message "Calling script9.sh: Removal of junk “parent topic” element in md files"
./parent-topic-removal-folder.sh "$input_folder" >> "$log_file" 2>&1

# Call the tenth script with the input folder
log_message "Calling script10.sh: Addressing junk html values and removing all <div> element including <div class> and <div id> elements"
./div-final.sh "$input_folder" >> "$log_file" 2>&1

# Call the eleventh script with the input folder
log_message "Calling script11.sh: Converting all references of Xandr Platform to Microsoft Advertising in Invest, Monetize and Curate platform"
./xandr-microsoft-advertising.sh "$input_folder" >> "$log_file" 2>&1


log_message "Master script execution completed."

echo "Logs are available in $log_file"

