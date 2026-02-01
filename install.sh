#!/bin/bash

# Arrêter le script en cas d'erreur
set -e


echo "Installing CrowHugin's config..."

#Ensure the script is launch as root
if [ "$EUID" -ne 0 ]; then
  echo "Please be sure to be root."
  exit 1
fi


echo "Installing ..."
apt-get install software-properties-common -y
add-apt-repository ppa:neovim-ppa/unstable -y
apt update 
apt-get install neovim -y

apt-get install unzip -y
apt-get install npm -y

mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/CrowHugin/nvim-config ~/.config/nvim

echo "Done!"
