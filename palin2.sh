#!/bin/bash

read -p "Enter a phrase: " input
normalized=$(echo "$input" | tr -d '[:space:]')  # Remove spaces
reverse=$(echo "$normalized" | rev)

if [ "$normalized" == "$reverse" ]; then
    echo "\"$input\" is a palindrome"
else
    echo "\"$input\" is not a palindrome"
fi
