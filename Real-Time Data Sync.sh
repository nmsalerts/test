#!/bin/bash

# Configuration
SOURCE="/source/directory/"                # Source directory to sync
DESTINATION="user@server_ip:/destination/directory/"  # Destination directory
EXCLUDE="--exclude some_folder"            # Exclusion pattern (optional)
LOGFILE="/var/log/rsync_sync.log"          # Log file for rsync

# Display Menu
echo "Select an option for synchronization:"
echo "1. Manual Sync"
echo "2. Periodic Sync (via cron)"
echo "3. Real-Time Sync (via inotifywait)"
echo "4. Exit"
read -p "Enter your choice [1-4]: " choice

case $choice in
1)
    # Manual Sync
    echo "Starting manual synchronization..."
    rsync -avz $EXCLUDE $SOURCE $DESTINATION >> $LOGFILE 2>&1
    echo "Manual synchronization completed. Logs saved to $LOGFILE."
    ;;
2)
    # Periodic Sync via Cron
    echo "Setting up periodic synchronization via cron..."
    CRON_JOB="* * * * * rsync -avz $EXCLUDE $SOURCE $DESTINATION >> $LOGFILE 2>&1"
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "Cron job added. Synchronization will run every minute."
    ;;
3)
    # Real-Time Sync via inotifywait
    echo "Starting real-time synchronization using inotifywait..."
    if ! command -v inotifywait &>/dev/null; then
        echo "inotify-tools not installed. Installing now..."
        sudo apt install -y inotify-tools || sudo yum install -y inotify-tools
    fi

    # Real-Time Sync Script
    while inotifywait -r -e modify,create,delete,move $SOURCE; do
        echo "$(date): Detected changes. Synchronizing..."
        rsync -avz $EXCLUDE $SOURCE $DESTINATION >> $LOGFILE 2>&1
    done
    ;;
4)
    echo "Exiting."
    exit 0
    ;;
*)
    echo "Invalid choice. Please run the script again."
    exit 1
    ;;
esac
