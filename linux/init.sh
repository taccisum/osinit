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

# $1: 要安装的插件
# $2：zsh插件启动命令 (>> ~/.zshrc)
function install_zsh_plugin(){
    install $1
    # check if zsh installed
    if [ -f /bin/zsh ] ;then
        row=$(cat ~/.zshrc | grep "$2")
        if [ ! -z "$row" ];then
            echo '检测到zsh已启用'$1'插件，将不做任何修改'
        else
            echo "$2" >> ~/.zshrc
        fi
    else
        echo '检测到zsh未安装，将自动进行安装'
        install_zsh
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
    install_zsh_plugin \
        'autojump' \
        "[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh"

    install_zsh_plugin \
        'zsh-syntax-highlighting' \
        "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
}

main $@
