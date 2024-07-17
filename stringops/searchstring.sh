#!/bin/bash

read -p "Enter a string: " user_input
read -p "Enter the substring to search for: " substring

if [[ "$user_input" == *"$substring"* ]]; then
    echo "The string contains the substring."
else
    echo "The string does not contain the substring."
fi
