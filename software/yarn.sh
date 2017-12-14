#!/bin/sh

# install yarn repo
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# run apt-get update
sudo apt-get update

# install the packages from the other repos
sudo apt-get install yarn
