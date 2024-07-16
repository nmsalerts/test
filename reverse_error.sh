#!/bin/bash

# Check if argument is provided
if [ $# -eq 0 ]; then
  echo "Error: Please provide a number as an argument."
  echo "Usage: $0 <number>"
  exit 1
fi

# Read the number from command line argument
number="$1"

# Function to reverse the number
reverse_number() {
    local num="$1"
    local reversed=""
    local len=${#num}

    for (( i=$len-1; i>=0; i-- )); do
        reversed="$reversed${num:$i:1}"
    done

    echo "$reversed"
}

# Call the function to reverse the number
reversed_number=$(reverse_number "$number")

# Print the reversed number
echo "Original number: $number"
echo "Reversed number: $reversed_number"
