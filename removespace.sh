#!/bin/bash

read -p "Enter a string with leading and trailing spaces: " user_input
trimmed_string=$(echo "$user_input" | xargs)
echo "Trimmed string is: '$trimmed_string'"

