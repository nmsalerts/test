#!/bin/bash

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install Git
echo "Installing Git..."
sudo apt install -y git

# Install Docker
echo "Installing Docker..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Install VirtualBox
echo "Installing VirtualBox..."
sudo apt install -y virtualbox

# Install MySQL Workbench
echo "Installing MySQL Workbench..."
sudo apt install -y mysql-workbench

# Install pgAdmin
echo "Installing pgAdmin..."
sudo apt install -y pgadmin4

# Install MongoDB Compass
echo "Installing MongoDB Compass..."
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt update
sudo apt install -y mongodb-compass

# Install Postman
echo "Installing Postman..."
sudo snap install postman

# Install Jupyter Notebook
echo "Installing Jupyter Notebook..."
sudo apt install -y python3-pip
pip3 install jupyter

# Install Vagrant
echo "Installing Vagrant..."
sudo apt install -y vagrant

# Verify installations
echo "Verifying installations..."
git --version
docker --version
virtualbox --version
mysql-workbench --version
pgadmin4 --version
mongodb-compass --version
postman --version
jupyter --version
vagrant --version

echo "Installation of additional useful software completed successfully."

