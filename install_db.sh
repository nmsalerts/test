#!/bin/bash

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install MySQL Server
echo "Installing MySQL Server..."
sudo apt install -y mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql

# Secure MySQL Installation
echo "Securing MySQL Installation..."
sudo mysql_secure_installation <<EOF

Y
password
password
Y
Y
Y
Y
EOF

# Install MySQL Workbench
echo "Installing MySQL Workbench..."
sudo apt install -y mysql-workbench

# Install MongoDB
echo "Installing MongoDB..."
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

# Install Node.js and NPM
echo "Installing Node.js and NPM..."
sudo apt install -y nodejs npm

# Install Mongoose
echo "Installing Mongoose..."
npm install -g mongoose

# Verify installations
echo "Verifying installations..."
mysql --version
mysql-workbench --version
mongod --version
node --version
npm --version
npm list -g mongoose

echo "Installation of MySQL, MySQL Workbench, MongoDB, and Mongoose completed successfully."
