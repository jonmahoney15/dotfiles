#! /bin/bash

apt install zsh

chsh -s /usr/bin/zsh vagrant

awk -F: -v user="vagrant" '$1 == user {print $NF}' /etc/passwd
