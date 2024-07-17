#!/bin/bash

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install Java JDK and JRE
echo "Installing Java JDK and JRE..."
sudo apt install -y openjdk-11-jdk openjdk-11-jre

# Verify Java installation
echo "Verifying Java installation..."
java -version
javac -version

# Install IntelliJ IDEA Community Edition
echo "Installing IntelliJ IDEA Community Edition..."
sudo snap install intellij-idea-community --classic

# Verify IntelliJ IDEA installation
echo "Verifying IntelliJ IDEA installation..."
snap list intellij-idea-community

echo "Installation of Java JDK, JRE, and IntelliJ IDEA completed successfully."
