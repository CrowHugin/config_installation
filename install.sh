#!/bin/bash

NVIM_CONFIG="$HOME/.config/nvim"


# Arrêter le script en cas d'erreur
set -e


echo "Installing CrowHugin's config..."



echo "Installing ..."

install_if_missing() {
    if ! command -v $1 &> /dev/null; then
        echo "Installing $1..."
        sudo apt-get install $1 -y
    fi
}

sudo apt update 
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get install neovim -y

sudo apt-get install unzip -y
sudo apt-get install npm -y

echo "Installing fonts..."
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
./install.sh 0xProto


if [ -d "$NVIM_CONFIG" ]; then
  echo "An nvim config was detected, will be move to $NVIM_CONFIG.bak"
  mv ~/.config/nvim ~/.config/nvim.bak
fi

git clone https://github.com/CrowHugin/nvim-config ~/.config/nvim

echo "Done!"
