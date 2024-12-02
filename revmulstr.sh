#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <string1> <string2> ... <stringN>"
    exit 1
fi

reversed_list=()
for (( i=$#; i>0; i-- )); do
    reversed_list+=("${!i}")
done

reverse_string() {
    echo "$1" | rev
}

for str in "${reversed_list[@]}"; do
    reversed_string=$(reverse_string "$str")
    echo "$reversed_string"
done
