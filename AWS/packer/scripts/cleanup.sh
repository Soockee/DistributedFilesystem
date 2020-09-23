#!/bin/bash -eux

# uninstall ansible and remove PPA
sudo apt -y remove --purge ansible
sudo add-apt-repository --remove ppa:ansible/ansible

# apt cleanup
sudo apt -y autoremove
sudo apt -y update
