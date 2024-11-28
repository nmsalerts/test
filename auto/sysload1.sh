#!/bin/bash

# Function to display system uptime and load averages
display_uptime() {
    echo "=== System Uptime and Load Averages ==="
    uptime
    echo
}

# Function to display memory usage
display_memory_usage() {
    echo "=== Memory Usage ==="
    free -h
    echo
}

# Function to display CPU usage
display_cpu_usage() {
    echo "=== CPU Usage ==="
    mpstat | awk '/all/ {printf "CPU Load: %s%%\n", 100-$13}'
    echo
}

# Function to display disk usage
display_disk_usage() {
    echo "=== Disk Usage ==="
    df -h | awk 'NR==1 || $NF=="/"'  # Display header and root filesystem usage
    echo
}

# Function to display network usage
display_network_usage() {
    echo "=== Network Usage ==="
    echo "Interface Statistics:"
    sar -n DEV 1 1 | grep Average
    echo
}

# Function to display running processes
display_processes() {
    echo "=== Top 5 Memory-Consuming Processes ==="
    ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6
    echo
}

# Main program execution
clear
echo "====================================="
echo "       SYSTEM RESOURCE PAGE         "
echo "====================================="
echo

# Call the functions
display_uptime
display_memory_usage
display_cpu_usage
display_disk_usage
display_network_usage
display_processes

echo "====================================="
echo "         END OF REPORT              "
echo "====================================="
