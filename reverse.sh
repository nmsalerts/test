#!/bin/bash

# Function to reverse a string
reverse_string() {
    local input="$1"
    local len=${#input}
    local reversed=""

    for (( i=$len-1; i>=0; i-- )); do
        reversed="$reversed${input:$i:1}"
    done

    echo "$reversed"
}

# Main script
echo "Enter a string:"
read user_input

reversed=$(reverse_string "$user_input")
echo "Reversed string: $reversed"
