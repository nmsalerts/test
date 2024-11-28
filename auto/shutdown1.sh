#!/bin/bash

# List of remote hosts
REMOTE_HOSTS=("hostname1" "hostname2" "hostname3")
REMOTE_USER="username"
SSH_KEY="path/to/ssh/key"

# SSH command to execute shutdown on the remote server
SSH_COMMAND="sudo shutdown -h now"

# Loop through each remote host and execute shutdown command
for host in "${REMOTE_HOSTS[@]}"; do
    echo "Shutting down $host..."
    ssh -i "$SSH_KEY" "$REMOTE_USER@$host" "$SSH_COMMAND"
done
