#!/bin/bash

read -p "Enter a string: " user_input
read -p "Enter the suffix to check: " suffix

if [[ "$user_input" == *"$suffix" ]]; then
    echo "The string ends with the suffix."
else
    echo "The string does not end with the suffix."
fi
