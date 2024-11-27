#!/bin/bash

# Log file for system monitoring
LOG_FILE="/var/log/system_monitor.log"

# Ensure the log file exists and has the right permissions
touch "$LOG_FILE"
chmod 644 "$LOG_FILE"

# Interval for monitoring (in seconds)
INTERVAL=10

echo "Starting system monitor. Logs will be saved to $LOG_FILE."

while true; do
    # Timestamp
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    
    # CPU usage (user + system)
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    
    # Memory usage
    MEMORY_USAGE=$(free -m | awk '/Mem:/ { printf "%.2f", $3/$2 * 100.0 }')
    
    # Network connectivity check (ping Google's DNS)
    NETWORK_STATUS=$(ping -c 1 -W 1 8.8.8.8 &> /dev/null && echo "Connected" || echo "Disconnected")
    
    # Log the results
    echo "$TIMESTAMP | CPU: ${CPU_USAGE}% | Memory: ${MEMORY_USAGE}% | Network: $NETWORK_STATUS" | tee -a "$LOG_FILE"
    
    # Wait for the specified interval
    sleep $INTERVAL
done
