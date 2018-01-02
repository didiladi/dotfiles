#!/bin/sh

# install bazel
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

# run apt-get update
sudo apt-get update

# install the packages from the other repos
sudo apt-get install bazel
