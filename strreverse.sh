#!/bin/bash

read -p "Enter a string: " user_input
reversed_string=$(echo "$user_input" | rev)
echo "Reversed string is: $reversed_string"


