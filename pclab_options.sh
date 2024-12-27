#!/bin/bash

# Log file
LOGFILE="/var/log/lab_admin.log"

# Function to log messages
log_message() {
    echo "$(date): $1" | tee -a $LOGFILE
}

# Install prerequisites
install_pdsh_csh() {
    echo "Installing pdsh and csh..."
    sudo apt update && sudo apt install -y pdsh csh
    if [[ $? -eq 0 ]]; then
        log_message "pdsh and csh installed successfully."
    else
        log_message "Installation of pdsh and csh failed."
        exit 1
    fi
}

# Select laboratory
select_lab() {
    echo "Available Laboratories:"
    labs=("Lab1" "Lab2" "Lab3" "Exit")
    select lab in "${labs[@]}"; do
        case $lab in
        "Lab1")
            IP_FILE="lab1_ips.txt"
            break
            ;;
        "Lab2")
            IP_FILE="lab2_ips.txt"
            break
            ;;
        "Lab3")
            IP_FILE="lab3_ips.txt"
            break
            ;;
        "Exit")
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid selection. Try again."
            ;;
        esac
    done
    log_message "Selected Laboratory: $lab, IP List File: $IP_FILE"
}

# Perform tasks on selected lab
manage_lab() {
    echo "Tasks for $lab:"
    echo "1. Install Software on All Desktops"
    echo "2. Check Disk Usage on All Desktops"
    echo "3. Backup Data on All Desktops"
    echo "4. Execute Custom CSH Script"
    echo "5. Back to Lab Selection"
    read -p "Enter your choice: " task_choice

    case $task_choice in
    1)
        read -p "Enter software package to install (e.g., python3): " software
        pdsh -w ^$IP_FILE "sudo apt update && sudo apt install -y $software"
        log_message "Installed $software on all desktops in $lab."
        ;;
    2)
        pdsh -w ^$IP_FILE "df -h" | tee -a $LOGFILE
        log_message "Checked disk usage on all desktops in $lab."
        ;;
    3)
        read -p "Enter source directory for backup: " src
        read -p "Enter destination directory: " dest
        pdsh -w ^$IP_FILE "rsync -av $src $dest"
        log_message "Backup completed for all desktops in $lab."
        ;;
    4)
        read -p "Enter full path of the CSH script: " csh_script
        pdsh -w ^$IP_FILE "csh $csh_script"
        log_message "Executed CSH script: $csh_script on all desktops in $lab."
        ;;
    5)
        select_lab
        ;;
    *)
        echo "Invalid choice. Please try again."
        manage_lab
        ;;
    esac
}

# Main Menu
main_menu() {
    echo "Main Menu:"
    echo "1. Install pdsh and csh"
    echo "2. Select Laboratory"
    echo "3. Exit"
    read -p "Enter your choice: " main_choice

    case $main_choice in
    1)
        install_pdsh_csh
        ;;
    2)
        select_lab
        manage_lab
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