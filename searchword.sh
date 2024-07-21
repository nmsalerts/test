#!/bin/bash

# Directory to search (current directory by default)
search_dir="."

# Find all .txt files in the directory and its subdirectories, then count occurrences of 'Linux'
total_count=$(find "$search_dir" -type f -name "*.txt" -exec grep -wo "Linux" {} + | wc -l)

# Print the total count
echo "Total occurrences of the word 'Linux': $total_count"

