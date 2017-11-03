#!/bin/bash

# DOCKER INSTALLATION
#
# The following installation procedure is extracted from:
# 
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/
# https://docs.docker.com/engine/installation/linux/linux-postinstall/

# prerequisites
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Compare the key fingerprint. Output should look like this:
# pub   4096R/0EBFCD88 2017-02-22
#       Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
# uid                  Docker Release (CE deb) <docker@docker.com>
# sub   4096R/F273FCD8 2017-02-22
sudo apt-key fingerprint 0EBFCD88

# this could be automated TODO
read -p "Press enter to continue if the key is correct (0EBFCD88)"

# add the repo:
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce

# verify installation:
sudo docker run hello-world

# these steps need to be performed to ensure docker doesn't need root
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world

# start docker demon on system start
sudo systemctl enable docker

