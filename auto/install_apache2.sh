#!/bin/bash

# Check if script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script with sudo."
  exit 1
fi

# Update package lists and install Apache
echo "Updating package lists..."
apt update
echo "Installing Apache..."
apt install -y apache2

# Enable Apache modules if needed (example: rewrite module)
a2enmod rewrite

# Start Apache service
echo "Starting Apache..."
systemctl start apache2

# Enable Apache to start on boot
systemctl enable apache2

# Firewall configuration (if applicable)
echo "Configuring firewall..."
ufw allow 'Apache'

echo "Apache installation completed."
