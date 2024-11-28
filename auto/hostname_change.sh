#!/bin/bash

# Define the network range
network_range="10.23.101."

# Define the log file
log_file="hostname_change_log.txt"

# Function to change hostname of a system
change_hostname() {
    local ip=$1
    local username="administrator"
    local password="zaq1@#WSX"  # Replace with actual admin password

    # Extract last two digits of the IP address
    last_two_digits=$(echo "$ip" | awk -F'.' '{print $4}')
    new_hostname="ccf$last_two_digits"

    # Attempt to change hostname
    echo "Attempting to change hostname of $ip to $new_hostname..." >> "$log_file"
    cmd="echo \"${password}\" | sudo -Sk hostnamectl set-hostname $new_hostname"
    sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$username@$ip" "$cmd" >> "$log_file" 2>&1

    # Check if the hostname change was successful
    if [ $? -eq 0 ]; then
        echo "Hostname of $ip changed to $new_hostname successfully." >> "$log_file"
    else
        echo "Failed to change hostname of $ip." >> "$log_file"
    fi
}

# Loop through the network range
for ((i=101; i<=156; i++))
do
    ip="$network_range$i"
    # Check if the system is reachable
    ping -c 1 -W 1 "$ip" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        change_hostname "$ip"
    else
        echo "$ip is not reachable." > "$log_file"
    fi
done

echo "Hostname change process completed. Please check the log file: $log_file"

