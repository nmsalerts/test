#!/bin/bash

# Function to add a user
add_user() {
    username=$1
    password=$2

    # Add user with specified username and password
    sudo useradd -m -s /bin/bash "$username"
    echo "$username:$password" | sudo chpasswd

    echo "User $username added successfully."
}

# Function to delete a user
delete_user() {
    username=$1

    # Delete user and their home directory
    sudo userdel -r "$username"

    echo "User $username deleted successfully."
}

# Function to find and delete old files created by users
delete_old_files() {
    days=$1

    # Find and delete files older than specified days
    find /home/* -type f -mtime +$days -exec rm -f {} \;

    echo "Files older than $days days deleted successfully."
}

# Check the first argument to determine the action
case "$1" in
    add)
        if [ -n "$2" ] && [ -n "$3" ]; then
            add_user "$2" "$3"
        else
            echo "Usage: $0 add <username> <password>"
        fi
        ;;
    delete)
        if [ -n "$2" ]; then
            delete_user "$2"
        else
            echo "Usage: $0 delete <username>"
        fi
        ;;
    cleanup)
        if [ -n "$2" ]; then
            delete_old_files "$2"
        else
            echo "Usage: $0 cleanup <days>"
        fi
        ;;
    *)
        echo "Usage: $0 {add|delete|cleanup} ..."
        ;;
esac

