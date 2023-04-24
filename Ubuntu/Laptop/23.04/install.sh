#!/bin/bash

# Update package lists
sudo apt update

# Update package lists
sudo apt -y upgrade

#disable Wayland
sudo sed -i 's/^#.*WaylandEnable=.*/WaylandEnable=false/' /etc/gdm3/custom.conf

#random

#download packages
cd Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://dl.discordapp.net/apps/linux/0.0.26/discord-0.0.26.deb
wget https://iriun.gitlab.io/iriunwebcam-2.8.deb
cd ..
wget -O- https://aka.ms/install-vscode-server/setup.sh | sh
#add apt repository
sudo add-apt-repository ppa:nextcloud-devs/client

# Install packages and applications
sudo apt install -y make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip -y
sudo apt update
sudo apt install -y libc++1 curl git cmake python3-pip openssh-server python3 docker.io docker-compose transmission g++ build-essential ascii 
sudo apt autoremove
sudo apt update
sudo apt install -y nextcloud-client timeshift chrome-gnome-shell adb scrcpy 

sudo apt update
#Run downloaded packages
cd Downloads
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install
sudo dpkg -i discord-0.0.26.deb
sudo apt --fix-broken install
sudo dpkg -i iriunwebcam-2.8.deb
sudo apt --fix-broken install
cd ..

#start pakages
sudo systemctl enable ssh

#git config
git config --global user.name "Omari Warner"
git config --global user.email "omari.warner@outlook.com"

#Snap packages
sudo snap install code --classic
sudo snap install spotify
#Android studio install
sudo snap install android-studio --classic

# Clean up package cache
sudo apt autoremove
