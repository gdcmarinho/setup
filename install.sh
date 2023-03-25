#!/bin/bash

install() {
    echo 'Downloading package information from all configured sources'
    sudo apt-get update

    echo 'What is your fullname (Git configuration)?'
    read USER_FULLNAME
    
    echo 'What is your email address (Git configuration)?'
    read USER_EMAIL
    
    sudo apt-get install git
    
    echo 'Starting Git configuration with provided data...'
    git config --global user.name "$USER_FULLNAME"
    git config --global user.email "$USER_EMAIL"
    
    echo 'Installing OpenJDK 17...'
    sudo add-apt-repository ppa:openjdk-r/ppa
    sudo apt-get update
    
    echo 'Installing essential software to environment'
    sudo apt-get install build-essential zsh ruby openjdk-17-jdk xmlstarlet htop
    
    echo 'Installing OhMyZsh to improve terminal experience'
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    echo '✅ Installation and configuration completed successfully'
}

install
