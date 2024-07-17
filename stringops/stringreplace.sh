#!/bin/bash

read -p "Enter a string: " user_input
read -p "Enter the substring to replace: " old_substring
read -p "Enter the new substring: " new_substring

new_string=${user_input/$old_substring/$new_substring}
echo "Replaced string is: $new_string"
