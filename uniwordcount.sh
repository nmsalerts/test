#!/bin/bash

# Input file
input_file="input.txt"

# Temporary file to store words
temp_file="words.txt"

# Extract words from the file
tr -cs '[:alnum:]' '[\n*]' < "$input_file" | tr '[:upper:]' '[:lower:]' > "$temp_file"

# Sort and count unique words
sort "$temp_file" | uniq -c | sort -nr

# Cleanup temporary file
rm "$temp_file"

