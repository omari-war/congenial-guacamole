#!/bin/bash

# Update package lists
sudo apt update

# Update package lists
sudo apt -y upgrade

#disable Wayland
sudo sed -i 's/^#.*WaylandEnable=.*/WaylandEnable=false/' /etc/gdm3/custom.conf

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
sudo apt install make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip -y
sudo apt update
sudo apt install -y libc++1 curl git cmake python3-pip openssh-server python3 docker.io docker-compose transmission g++ build-essential ascii 
sudo apt autoremove
sudo apt update
sudo apt install -y nextcloud-client timeshift chrome-gnome-shell adb scrcpy 

sudo apt update
#Run downloaded packages
cd Downloads
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg -i discord-0.0.26.deb
sudo dpkg -i iriunwebcam-2.8.deb
cd ..

#start pakages
sudo systemctl enable ssh

#git config
git config --global user.name "Omari Warner"
git config --global user.email "omari.warner@outlook.com"

#flutter install
sudo snap install flutter --classic
export PATH="/home/ubuntu/snap/flutter/common/flutter"
#Snap packages
sudo snap install code --classic
sudo snap install spotify
#Android studio install
sudo snap install android-studio --classic

# Example: sudo apt install curl firefox
# docker container
docker pull portainer/agent:latest
sudo docker run -d -p 9001:9001 --name portainer_agent --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes portainer/agent:latest

# Clean up package cache
sudo apt autoremove
