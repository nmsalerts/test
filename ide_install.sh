#!/bin/bash

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install required dependencies
sudo apt install -y wget apt-transport-https software-properties-common

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code

# Install PyCharm Community Edition
echo "Installing PyCharm Community Edition..."
sudo snap install pycharm-community --classic

# Install Thonny
echo "Installing Thonny..."
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y thonny

# Install Python and pip (if not already installed)
echo "Installing Python and pip..."
sudo apt install -y python3 python3-pip

# Verify installations
echo "Verifying installations..."
code --version
pycharm-community --version
thonny --version
python3 --version
pip3 --version

echo "Installation of Visual Studio Code, PyCharm, Thonny, Python, and pip completed successfully."
