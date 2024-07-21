#!/bin/bash

# Check if any input is provided
if [ -z "$1" ]; then
  echo "Error: No input provided. Please execute the script with a number."
  exit 1
fi

# Get the input number
input=$1

# Reverse the number
reversed=$(echo "$input" | rev)

# Print the reversed number
echo "Reversed Number: $reversed"

