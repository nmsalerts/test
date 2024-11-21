#!/bin/bash

for num in {1..100}; do
    reverse=$(echo "$num" | rev)
    if [ "$num" == "$reverse" ]; then
        echo "$num is a palindrome"
    fi
done
