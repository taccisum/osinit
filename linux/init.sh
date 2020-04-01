#!/bin/sh

cd $(dirname $0)
USE_LOCAL=${USE_LOCAL:-}

function install_zsh(){
    yum install zsh -y
    install_oh_my_zsh
}

function install_oh_my_zsh(){
    if [ -z $USE_LOCAL ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        sh local/zsh_install.sh
    fi
}

function install(){
    yum install $1 -y
}

function main(){
    install_zsh

    # common tools
    tools=(
        'vim'
        'tree'
        'jq'
    )

    for tool in ${tools[@]};
    do
        install $tool
    done

    # zsh plugins
    install autojump-zsh

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

main $@
