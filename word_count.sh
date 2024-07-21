#!/bin/bash

# Check if the file is provided as input
if [ -z "$1" ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File not found!"
    exit 1
fi

# Process the file to find unique words and count their occurrences
cat "$1" | tr -s ' ' '\n' | tr -cd '[:alnum:] [:space:]' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr

