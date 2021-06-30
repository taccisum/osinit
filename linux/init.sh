#!/bin/sh

cd $(dirname $0)
USE_LOCAL=${USE_LOCAL:-}
OH_MY_ZSH_PLUGIN_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom/plugins}

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
    if [ ! $? -eq 0 ];then
        echo 'fail to install oh my zsh.'
        exit 1
    fi
}

function setup_zsh_plugin(){
    sed -i "/source \$ZSH\/oh-my-zsh.sh/i plugins=(\${plugins[@]} $1)" ~/.zshrc
}

function install(){
    yum install $1 -y
}

function main(){
    install git

    install_zsh

    echo 'add node rpm source'
    curl -sL https://rpm.nodesource.com/setup_14.x | bash -

    # common tools
    tools=(
        'vim'
        'tree'
        'jq'
        'nodejs'
    )

    for tool in ${tools[@]};
    do
        install $tool
    done

    # zsh plugins
    install autojump-zsh

    if [ ! -e ${OH_MY_ZSH_PLUGIN_DIR}/zsh-autosuggestions ];then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${OH_MY_ZSH_PLUGIN_DIR}/zsh-autosuggestions
        setup_zsh_plugin zsh-autosuggestions
    else
        echo 'autosugesstions has installed'
    fi
}

main $@
