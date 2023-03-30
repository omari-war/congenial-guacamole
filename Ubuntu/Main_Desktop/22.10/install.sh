#!/bin/bash

# Update package lists
sudo apt update

# Update package lists
sudo apt -y upgrade

#disable Wayland
sudo sed -i 's/^#.*WaylandEnable=.*/WaylandEnable=false/' /etc/gdm3/custom.conf

#random
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7A3A762FAFD4A51F

#download packages
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://dl.discordapp.net/apps/linux/0.0.25/discord-0.0.25.deb
wget -O- https://aka.ms/install-vscode-server/setup.sh | sh
wget -O- https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
#add apt repository
sudo add-apt-repository ppa:nextcloud-devs/client
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo add-apt-repository "deb http://repository.spotify.com stable non-free"

# Install packages and applications
sudo apt install make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip -y
sudo apt install -y libc++1 curl git cmake python3-pip openssh-server python3 docker.io docker-compose transmission g++ build-essential ascii 
sudo apt install -y gimp nextcloud-client spotify-client inkspace timeshift

#Run downloaded packages
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg -i discord-0.0.25.deb

#start pakages
sudo systemctl enable ssh

# Example: sudo apt install curl firefox

# Clean up package cache
sudo apt autoremove