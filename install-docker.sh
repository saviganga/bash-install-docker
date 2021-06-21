#!/usr/bin/bash

# get sudo password from user
read -sp "Enter sudo password: " sudoPW

# update existing packages
echo ${sudoPW} |  sudo -S apt update

# prerequisites to allow apt packages over https
echo ${sudoPW} | sudo -S apt install apt-transport-https ca-certificates curl software-properties-common

# add GPG key for official Docker repo to system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add docker repo to APT sources
echo ${sudoPW} | sudo -S add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# update existing packages
echo ${sudoPW} | sudo -S apt update

# confirm download from docker repo
apt-cache policy docker-ce

# install docker 
echo ${sudoPW} | sudo -S apt install docker-ce
