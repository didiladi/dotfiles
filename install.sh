#!/bin/bash

# get the current directory
dir=$(pwd)

# install the essentials
sudo apt-get install \
	i3 \
	thunar \
	vim \
	neovim \
	thunderbird \
	shutter \
	jshon \
	libssl-dev \
	apache2-utils \
	cmake

# install snaps:
sudo snap install \
	hugo

# install git lfs:
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs

# install java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java9-installer
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java9-set-default

# install python
sudo apt-get install \
	python3-pip \
	jupyter-core \
	jupyter-notebook \
	python3-tk \
	python3-scrapy

pip3 install \
	jupyter \
	wheel \
	pandas \
	scipy \
	pylint \
	xlrd \
	sklearn \
	matplotlib \
	scrapy \
	tensorflow \
	tensorflow-utils \
	opencv-python \
	keras \
	scikit-image \
	cython \
	h5py \
	autopep8 \
	rope

# install rust
curl https://sh.rustup.rs -sSf | sh
source ~/.bashrc

rustup update stable
rustup update nightly

# https://github.com/rust-lang-nursery/rls
rustup component add rls-preview --toolchain nightly
rustup component add rust-analysis --toolchain nightly
rustup component add rust-src --toolchain nightly

cargo install racer

# install non-essential stuff
sudo apt-get install \
	gnome-icon-theme \
	inkscape \
	hardinfo \
	gimp \
	virtualbox \
	virtualbox-qt \
	virtualbox-dkms \
	python-autopep8

# software to remove
sudo apt-get remove nautilus

# create dirs
mkdir -p ~/scripts
mkdir -p ~/notes

# create symbolic links
ln -s Documents/ documents
ln -s Downloads/ downloads
ln -s Videos/ videos
ln -s Pictures/ pictures

# fix sh (should point to bash instead of dash)
sudo ln -fs bash /bin/sh

# increase watch limit inotify
sudo echo "fs.inotify.max_user_watches = 524288" >> /etc/sysctl.conf
sudo sysctl -p --system

# install fonts used by nvim
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
curl -fLo "Roboto Mono Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf
fc-cache -fv

# install z.sh
mkdir ~/scripts/z
cd ~/scripts/z
curl -fLo "z.sh" https://github.com/rupa/z/raw/master/z.sh
chmod +x z.sh
cd $dir

# get node version manager (run nvm install node)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash

# install additional software from other repos
for f in ./software/*.sh
do
	sh $f
done

# docker cleanup script:
cp -f ./software/docker/*.sh ~/scripts/

# copy files from this git repo
cp -f ./bash/.bash_aliases ~/.bash_aliases
cp -f ./bash/.bashrc ~/.bashrc
cp -f ./i3/config ~/.config/i3/config
cp -f ./vim/.vimrc ~/.vimrc
cp -f ./git/.gitconfig ~/.gitconfig
cp -f ./xmodmap/.xmodmap ~/.xmodmap

# remap capslock to esc
xmodmap ~/.xmodmap

# configure nvim
mkdir ~/.config/nvim/
ln -s ~/.vimrc ~/.config/nvim/init.vim

# reload bash (now nvm is in path)
source ~/.bashrc

# install all the node related things
nvm install node
source ~/.bashrc
npm install -g typescript
npm install -g tslint
npm install -g ionic
npm install -g cordova

# TODO terminal profile
# TODO run tuxedo.sh (make it work on i3)
# TODO slack
# TODO ghetto-skype
# TODO crontab

