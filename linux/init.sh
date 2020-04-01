#!/bin/sh

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh
yum install zsh -y

# install oh-my-zsh
sh zsh_install.sh
