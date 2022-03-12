# setup vim by github amix/vimrc
setup_amix_vimrc() {
    if [ -d ~/.vim_runtime ]; then
        echo '[skip] amix/vimrc exists.'
    else
        git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
        sh ~/.vim_runtime/install_awesome_vimrc.sh
    fi
}

