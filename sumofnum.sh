awk '{sum += $1} END {print sum}' <(grep -o '[0-9]\+' yourfile.txt)

