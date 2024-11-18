#!/bin/bash

# Check if a file is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi

# Process the file
echo "Unique words and their counts in the file $1:"
tr '[:space:]' '[\n*]' < "$1" |      # Replace spaces with newlines
tr -d '[:punct:]' |                  # Remove punctuation
tr '[:upper:]' '[:lower:]' |         # Convert to lowercase
sort |                               # Sort the words alphabetically
uniq -c |                            # Count occurrences of each word
sort -nr                             # Sort by count in descending order
