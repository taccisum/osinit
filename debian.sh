#!/bin/bash

cd $(dirname $0)

source common/tools.sh
source common/core.sh
source common/vim.sh
source common/zsh.sh

setup_autojump(){
    sed -i "/source \$ZSH\/oh-my-zsh.sh/i . /usr/share/autojump/autojump.sh" ~/.zshrc
}

main(){
    pre_install

    install_zsh

    # setup node.js
    echo 'add node.js rpm source'
    curl -sL https://rpm.nodesource.com/setup_14.x | bash -

    install_all_tools

    # zsh plugins
    install autojump
    # TODO: setup autojump

    setup_zsh_autosuggestions
    setup_amix_vimrc
}

main $@