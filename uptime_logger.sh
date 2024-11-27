#!/bin/bash

LOG_FILE="/var/log/uptime.log"

# Ensure the log file exists
touch "$LOG_FILE"
chmod 644 "$LOG_FILE"

# Infinite loop to log uptime
while true; do
    echo "$(date): $(uptime)" >> "$LOG_FILE"
    sleep 60
done
