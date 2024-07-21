#!/bin/bash

# Check if a directory is passed as an argument, if not use the current directory
dir=${1:-.}

# Count the number of files in the directory and its subdirectories
file_count=$(find "$dir" -type f | wc -l)

# Count the number of subdirectories in the directory and its subdirectories
dir_count=$(find "$dir" -type d | wc -l)

# Print the counts
echo "Number of files: $file_count"
echo "Number of subdirectories: $((dir_count - 1))"  # Subtract 1 to exclude the base directory itself

