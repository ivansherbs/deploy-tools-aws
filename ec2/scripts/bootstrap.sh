#!/bin/bash

readonly dirname="$(dirname $0)"

# bash customization
sed -i 's/ls -laF/ls -lF/' ~/.bashrc
sed -i 's/ls -A/ls -alF/' ~/.bashrc

# Vim customization
if [ ! -f ~/.vimrc ]; then
  cp "${dirname}/files/.vimrc" ~/.vimrc
fi

# sshd service configuration
sudo sed -i 's/ LC_\*$/ LC_* GIT_*/' /etc/ssh/sshd_config
sudo service sshd restart

# general distribution updates
sudo apt-get update > /dev/null

