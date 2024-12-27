#!/bin/bash

# Log file
LOGFILE="/var/log/user_lab_admin.log"

# Function to log messages
log_message() {
    echo "$(date): $1" | tee -a $LOGFILE
}

# Menu for User Management
user_management() {
    echo "User Management Options:"
    echo "1. Create User"
    echo "2. Modify User"
    echo "3. Delete User"
    echo "4. Set Disk Quota"
    echo "5. Back to Main Menu"
    read -p "Enter your choice: " um_choice

    case $um_choice in
    1)
        read -p "Enter username: " username
        sudo useradd -m -s /bin/bash "$username"
        log_message "User '$username' created successfully."
        ;;
    2)
        read -p "Enter username to modify: " username
        read -p "Enter new shell (e.g., /bin/zsh): " shell
        sudo usermod -s "$shell" "$username"
        log_message "User '$username' modified successfully."
        ;;
    3)
        read -p "Enter username to delete: " username
        sudo userdel -r "$username"
        log_message "User '$username' deleted successfully."
        ;;
    4)
        read -p "Enter username: " username
        read -p "Enter soft quota (e.g., 100M): " soft_quota
        read -p "Enter hard quota (e.g., 200M): " hard_quota
        sudo setquota -u "$username" "$soft_quota" "$hard_quota" 0 0 /
        log_message "Quota set for user '$username' (soft: $soft_quota, hard: $hard_quota)."
        ;;
    5)
        main_menu
        ;;
    *)
        echo "Invalid choice. Please try again."
        user_management
        ;;
    esac
}

# Menu for Lab Administration
lab_administration() {
    echo "Lab Administration Options:"
    echo "1. Install Software"
    echo "2. Monitor Disk Usage"
    echo "3. Check Network Connectivity"
    echo "4. Backup Data"
    echo "5. Back to Main Menu"
    read -p "Enter your choice: " la_choice

    case $la_choice in
    1)
        read -p "Enter software to install (e.g., python3, mysql-server): " software
        sudo apt update && sudo apt install -y "$software"
        log_message "Software '$software' installed successfully."
        ;;
    2)
        df -h | tee -a $LOGFILE
        log_message "Disk usage monitored."
        ;;
    3)
        read -p "Enter IP or domain to ping: " target
        ping -c 4 "$target" | tee -a $LOGFILE
        log_message "Network connectivity checked for '$target'."
        ;;
    4)
        read -p "Enter source directory to backup: " src
        read -p "Enter destination directory: " dest
        sudo rsync -av "$src" "$dest"
        log_message "Backup completed from '$src' to '$dest'."
        ;;
    5)
        main_menu
        ;;
    *)
        echo "Invalid choice. Please try again."
        lab_administration
        ;;
    esac
}

# Main Menu
main_menu() {
    echo "Main Menu:"
    echo "1. User Management"
    echo "2. Lab Administration"
    echo "3. Exit"
    read -p "Enter your choice: " main_choice

    case $main_choice in
    1)
        user_management
        ;;
    2)
        lab_administration
        ;;
    3)
        echo "Exiting. Logs are saved in $LOGFILE."
        exit 0
        ;;
    *)
        echo "Invalid choice. Please try again."
        main_menu
        ;;
    esac
}

# Start the script
main_menu
