#!/usr/bin/env node

import shell from 'shelljs';

install();

export default function install() {
    shell.echo('Downloading package information from all configured sources');
    shell.exec('sudo apt-get update');

    shell.echo('What is your fullname (Git configuration)?');
    shell.exec('read USER_FULLNAME');
    
    shell.echo('What is your email address (Git configuration)?');
    shell.exec('read USER_EMAIL');
    
    shell.exec('sudo apt-get install git');
    
    shell.echo('Starting Git configuration with provided data...');
    shell.exec('git config --global user.name $USER_FULLNAME');
    shell.exec('git config --global user.email $USER_EMAIL');
    
    shell.echo('Installing OpenJDK 17...');
    shell.exec('sudo add-apt-repository ppa:openjdk-r/ppa');
    shell.exec('sudo apt-get update');
    
    shell.echo('Installing essential software to environment');
    shell.exec('sudo apt-get install build-essential zsh ruby openjdk-17-jdk xmlstarlet htop');
    
    shell.echo('Installing OhMyZsh to improve terminal experience');
    shell.exec('sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"');
    
    shell.echo('✅ Installation and configuration completed successfully');
}