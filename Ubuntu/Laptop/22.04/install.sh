#!/bin/bash

# Update package lists
sudo apt update

# Update package lists
sudo apt -y upgrade

#disable Wayland
sudo sed -i 's/^#.*WaylandEnable=.*/WaylandEnable=false/' /etc/gdm3/custom.conf



#download packages
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#wget https://dl.discordapp.net/apps/linux/0.0.25/discord-0.0.25.deb
wget -O- https://aka.ms/install-vscode-server/setup.sh | sh
wget https://builds.parsec.app/package/parsec-linux.deb

#add apt repository
sudo add-apt-repository ppa:nextcloud-devs/client
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo add-apt-repository ppa:discordapp/discord

# Update package lists after adding repository
sudo apt update

# Install packages and applications
sudo apt install make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip -y
sudo apt install -y libc++1 curl git cmake python3-pip openssh-server python3 g++ build-essential ascii 
sudo apt install -y gimp nextcloud-client spotify-client discord libreoffice timeshift


#Run downloaded packages
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo dpkg -i parsec-linux.deb
#sudo dpkg -i discord-0.0.25.deb

#start pakages
sudo systemctl enable ssh

#git config
git config --global user.name "Omari Warner"
git config --global user.email "omari.warner@outlook.com"
git config --list
#verify
libreoffice --version

#random
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7A3A762FAFD4A51F
sudo apt update
sudo apt install -y spotify-client

# Clean up package cache
sudo apt autoremove