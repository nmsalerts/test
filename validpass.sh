#!/bin/bash

# Function to validate password strength
validate_password() {
    local password="$1"
    local len=${#password}
    local has_alpha=false
    local has_number=false
    local has_lower=false
    local has_upper=false

    # Check length
    if [ "$len" -lt 8 ]; then
        echo "Password must be at least 8 characters long."
        return 1
    fi

    # Check for alphabet and number
    if [[ "$password" =~ [0-9] ]]; then
        has_number=true
    fi

    if [[ "$password" =~ [a-zA-Z] ]]; then
        has_alpha=true
    fi

    # Check for lowercase and uppercase letters
    if [[ "$password" =~ [a-z] ]]; then
        has_lower=true
    fi

    if [[ "$password" =~ [A-Z] ]]; then
        has_upper=true
    fi

    # Validate all conditions
    if $has_alpha && $has_number && $has_lower && $has_upper; then
        echo "Password strength is valid."
        return 0
    else
        echo "Password must contain at least one each of alphabet (lowercase and uppercase) and number."
        return 1
    fi
}

# Main script
echo "Enter your password:"
read -s user_password  # -s flag hides the input (silent mode)

validate_password "$user_password"
