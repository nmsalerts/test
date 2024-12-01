#!/bin/bash

# Function to check password strength
validate_password() {
    password=$1

    # Check length
    if [ ${#password} -lt 8 ]; then
        echo "Password must be at least 8 characters long."
        return 1
    fi

    # Check for at least one number
    if ! [[ $password =~ [0-9] ]]; then
        echo "Password must contain at least one number."
        return 1
    fi

    # Check for at least one lowercase letter
    if ! [[ $password =~ [a-z] ]]; then
        echo "Password must contain at least one lowercase letter."
        return 1
    fi

    # Check for at least one uppercase letter
    if ! [[ $password =~ [A-Z] ]]; then
        echo "Password must contain at least one uppercase letter."
        return 1
    fi

    # Check for at least one special character
    if [ `echo $password | grep -c -E "[@#$%&*+-=]+"` -eq 0 ]; then
        echo "Password must contain at least one special character."
        return 1
    fi

    echo "Password is strong."
    return 0
}

# Check if password is provided as input
if [ -z "$1" ]; then
    echo "Usage: $0 <password>"
    exit 1
fi

# Validate the password
validate_password "$1"

