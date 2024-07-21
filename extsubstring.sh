#!/bin/bash

read -p "Enter a string: " user_input
read -p "Enter the starting position: " start_pos
read -p "Enter the length of the substring: " length

substring=${user_input:start_pos:length}
echo "Extracted substring is: $substring"

