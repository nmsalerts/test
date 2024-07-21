#!/bin/bash

# Input file
input_file="input.txt"

# Temporary file to store the results
temp_file="temp.txt"

# Process the file line by line
while IFS= read -r line; do
    # Extract words from the 5th to 7th position
    words=($line)
    range=("${words[@]:4:3}")

    # Check if the word '<dd>' is in the range
    if [[ ! " ${range[@]} " =~ " <dd> " ]]; then
        echo "$line" >> "$temp_file"
    fi
done < "$input_file"

# Replace the original file with the modified content
mv "$temp_file" "$input_file"

