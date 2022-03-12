#!/bin/bash

install_nodejs() {
    echo install node.js...
    which node >> /dev/null
    if [ $? -eq 0 ];then
        echo [skip] node.js has installed
        return
    fi

    # setup node.js
    echo 'add node.js rpm source'
    curl -sL https://rpm.nodesource.com/setup_14.x | bash -
    install nodejs
}
