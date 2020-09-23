#!/bin/bash -eux

# install ansible repository
# sudo apt -y update && sudo apt-get -y upgrade
# sudo apt -y install software-properties-common
# sudo apt-add-repository ppa:ansible/ansible

# install ansible
# sudo apt -y update
# sudo apt -y install ansible

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py

# install ansible globally
sudo python3 -m pip install ansible