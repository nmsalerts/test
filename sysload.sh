#!/bin/bash

# Function to get system information
get_system_info() {
    local datetime=$(date +"%a %b %d %I:%M:%S %p %Z %Y")
    local system_load=$(uptime | awk '{print $(NF-2)}' | tr -d ',')
    local memory_usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
    local swap_usage=$(free | awk '/Swap:/ {printf "%.0f", $3/$2 * 100}')
    local disk_usage=$(df / | awk 'NR==2 {print $5}')
    local temperature=$(sensors | awk '/Package id 0:/ {print $4}' | tr -d '+°C')
    local processes=$(ps -e --no-headers | wc -l)
    local users_logged_in=$(who | wc -l)

    # Output system information
    echo "Welcome to Ubuntu 22.04.4 LTS (GNU/Linux $(uname -r) $(uname -m))"
    echo
    echo " * Documentation:  https://help.ubuntu.com"
    echo " * Management:     https://landscape.canonical.com"
    echo " * Support:        https://ubuntu.com/pro"
    echo
    echo " System information as of $datetime"
    echo
    echo "  System load:  $system_load                Swap usage:  $swap_usage%       Users logged in: $users_logged_in"
    echo "  Usage of /:   $disk_usage of $(df -h / | awk 'NR==2 {print $2}')   Temperature: ${temperature:-N/A} C"
    echo "  Memory usage: $memory_usage%                  Processes:   $processes"
}

# Clear the screen and display system information
clear
get_system_info
