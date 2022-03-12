#!bin/bash

install_zsh() {
	install zsh
    install_oh_my_zsh
}

install_oh_my_zsh(){
    echo install oh-my-zsh...
    if [ -d ~/.oh-my-zsh ];then
        echo [skip] oh-my-zsh is installed.
        return
    fi

    if [ -z $USE_LOCAL ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
	# use source in local folder
        sh ../local/zsh_install.sh
    fi
    if [ ! $? -eq 0 ];then
        echo 'fail to install oh my zsh.'
        exit 1
    fi
}

_setup_zsh_plugin(){
    sed -i "/source \$ZSH\/oh-my-zsh.sh/i plugins=(\${plugins[@]} $1)" ~/.zshrc
}

setup_zsh_autosuggestions(){
    echo install zsh-autosuggestions...
    if [ ! -e ${OH_MY_ZSH_PLUGIN_DIR}/zsh-autosuggestions ];then
        git clone https://github.com/zsh-users/zsh-autosuggestions ${OH_MY_ZSH_PLUGIN_DIR}/zsh-autosuggestions
        _setup_zsh_plugin zsh-autosuggestions
    else
        echo [skip] autosugesstions has installed.
    fi
}
