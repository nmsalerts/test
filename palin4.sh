#!/bin/bash

is_palindrome() {
    local str="$1"
    local reverse=$(echo "$str" | rev)

    if [ "$str" == "$reverse" ]; then
        echo "true"
    else
        echo "false"
    fi
}

read -p "Enter a string: " input
if [ "$(is_palindrome "$input")" == "true" ]; then
    echo "$input is a palindrome"
else
    echo "$input is not a palindrome"
fi


