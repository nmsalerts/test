#!/bin/bash

filename="words.txt"

while read -r word; do
    reverse=$(echo "$word" | rev)
    if [ "$word" == "$reverse" ]; then
        echo "$word is a palindrome"
    else
        echo "$word is not a palindrome"
    fi
done < "$filename"
