#!/bin/bash

# install the essentials
sudo apt-get install i3 thunar vim neovim thunderbird

# install python
sudo apt-get install python3-pip jupyter-core jupyter-notebook
pip3 install jupyter wheel pandas scipy pylint xlrd sklearn

# install non-essential stuff
sudo apt-get install gnome-icon-theme

# software to remove
sudo apt-get remove nautilus

# create symbolic links
ln -s Documents/ documents
ln -s Downloads/ downloads
ln -s Videos/ videos
ln -s Pictures/ pictures

# remap capslock to esc
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"
xmodmap -pke > ~/.xmodmap

# install yarn repo
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# install visual studio code repo
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# run apt-get update
sudo apt-get update

# install the packages from the other repos
sudo apt-get install yarn code

# copy files from this git repo
cp -f ./bash/.bash_aliases ~/.bash_aliases
cp -f ./bash/.bashrc ~/.bashrc
cp -f ./i3/config ~/.config/i3/config
cp -f ./vim/.vimrc ~/.vimrc
cp -f ./git/.gitconfig ~/.gitconfig

# configure nvim
mkdir ~/.config/nvim/
ln -s ~/.vimrc ~/.config/nvim/init.vim


# run tuxedo.sh (make it work on i3)

