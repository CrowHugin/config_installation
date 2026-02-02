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

#------nvim------
sudo apt update 
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get install neovim -y

sudo apt-get install unzip -y || echo "unzip is already installed, moving on ..."
sudo apt-get install npm -y || echo "npm is already installed, moving on ..."
sudo apt-get install gcc -y || echo "gcc is already install, moving on ..."
sudo apt-get install make -y || echo "make is already install, moving on ..."
sudo apt-get install curl -y || echo "curl is already install, moving on ..."
sudo apt-get install python3 -y || echo "python3 is already install, moving on ..."
sudo apt-get install ca-certificates -y || echo "ca-certificates is already install, moving on ..."

if [ -d "$NVIM_CONFIG" ]; then
  echo "An nvim config was detected, will be move to $NVIM_CONFIG.bak"
  rm -rf $NVIM_CONFIG.bak
  mv $NVIM_CONFIG $NVIM_CONFIG.bak
fi

git clone https://github.com/CrowHugin/nvim-config ~/.config/nvim


#------tmux------
sudo apt-get install tmux -y || echo ""
rm -rf ~/.config/tmux
git clone https://github.com/CrowHugin/tmux-config ~/.config/tmux/ || echo "tmux is already installed, moving on ..."
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/.tmux/plugins/tpm || echo "tmux tmp id already installed, moving on ..."
cp -r ~/.config/tmux/.tmux ~/.config/tmux/.tmux.conf ~/ 
rm -rf ~/.config/tmux

#------Nerd fonts------
echo "Installing fonts..."
cp -r ./fonts ~/.local/share/fonts/
fc-cache -fv

#------atuin------
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh || echo "atuin is already installed, moving on ..."
source $HOME/.atuin/bin/env

#------aliases------
sudo apt-get install eza

echo alias python=/bin/python3 >> ~/.bash_aliases
echo alias lse='eza -lha --icons=auto --sort=name --group-directories-first' >> ~/.bash_aliases
echo alias cl=clear >> ~/.bash_aliases

source ~/.bashrc

BLOCK='if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi'

if ! grep -qF "if [ -f ~/.bash_aliases ]; then" ~/.bashrc; then
    echo -e "\n$BLOCK" >> ~/.bashrc
fi




echo "Done !"
echo "Cleaning ..."

cd ../
rm -rf ./config_installation/

echo "Done!"
