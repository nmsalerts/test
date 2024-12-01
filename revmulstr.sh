#!/bin/bash

# Check if input is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <string1> <string2> ... <stringN>"
    exit 1
fi

# Reverse the order of the strings in the list
reversed_list=()
for (( i=$#; i>0; i-- )); do
    reversed_list+=("${!i}")
done

# Function to reverse a string
reverse_string() {
    echo "$1" | rev
}

# Reverse each string in the reversed list
for str in "${reversed_list[@]}"; do
    reversed_string=$(reverse_string "$str")
    echo "$reversed_string"
done
