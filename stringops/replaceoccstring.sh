#!/bin/bash

read -p "Enter a string: " user_input
read -p "Enter the prefix to check: " prefix

if [[ "$user_input" == "$prefix"* ]]; then
    echo "The string starts with the prefix."
else
    echo "The string does not start with the prefix."
fi
