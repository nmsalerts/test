#!/bin/bash

# Get the directory to analyze, default to the current directory
directory=${1:-$(pwd)}

echo "Analyzing files in directory: $directory"
echo "---------------------------------------"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Error: Directory does not exist!"
    exit 1
fi

# Loop through each file in the directory
for file in "$directory"/*; do
    if [ -e "$file" ]; then
        # Determine file type using `stat` and file properties
        if [ -h "$file" ]; then
            echo "Symbolic Link: $file"
        elif [ -d "$file" ]; then
            echo "Directory: $file"
        elif [ -c "$file" ]; then
            echo "Character Device File: $file"
        elif [ -b "$file" ]; then
            echo "Block Device File: $file"
        elif [ -p "$file" ]; then
            echo "FIFO (Named Pipe): $file"
        elif [ -S "$file" ]; then
            echo "Socket File: $file"
        elif [ -f "$file" ]; then
            echo "Regular File: $file"
        else
            echo "Unknown File Type: $file"
        fi
    fi
done

echo "---------------------------------------"
echo "File type analysis completed."
