USE_LOCAL=${USE_LOCAL:-}
OH_MY_ZSH_PLUGIN_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom/plugins}

pre_install() {
    install git
}

install(){
    echo install $1...
    which $1 >> /dev/null;
    if [ $? -eq 0 ];then
        echo [skip] $1 has installed.
    else
        which yum;
        if [ $? -eq 0 ]; then
            sudo yum install $1 -y
        else
            sudo apt-get install $1 -y
        fi
    fi
}

install_all_tools() {
    for tool in ${tools[@]};
    do
        install $tool
    done
}

