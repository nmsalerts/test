#!/bin/bash

read -p "Enter a string: " user_input
read -p "Enter the substring to remove: " substring

modified_string=${user_input/$substring/}
echo "String after removal: $modified_string"
