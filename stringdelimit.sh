#!/bin/bash

read -p "Enter a string with commas: " user_input
IFS=',' read -r -a array <<< "$user_input"

echo "Splitted strings are:"
for element in "${array[@]}"
do
    echo "$element"
done

