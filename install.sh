#!/bin/sh

# Update the operation system
echo "Updating the operation system..."
sudo apt-get update

echo "What is your fullname (Git configuration)?"
read USER_FULLNAME

echo "What is your email address (Git configuration)?"
read USER_EMAIL

sudo apt-get install git

echo "Starting Git configuration with provided data..."
git config --global user.name $USER_FULLNAME
git config --global user.email $USER_EMAIL

echo "Installing OpenJDK 17..."
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update

# Install essential software
echo "Installing essential software to environment"
sudo apt-get install zsh ruby openjdk-17-jdk

# Install OhMyZsh
echo "Installing OhMyZsh to improve terminal experience"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "✅ Installation and configuration completed successfully"
