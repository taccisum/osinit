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

install_nodejs_by_bin() {
    # see https://github.com/nodejs/help/wiki/Installation
    echo install node.js by binary archive...
    which node >> /dev/null
    if [ $? -eq 0 ];then
        echo [skip] node.js has installed
        return
    fi

    # setup node.js
    VERSION=v13.14.0
    DISTRO=linux-x64
    wget https://nodejs.org/dist/$VERSION/node-$VERSION-$DISTRO.tar.xz
    sudo mkdir -p /usr/local/lib/nodejs
    sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs
    sudo ln -s /usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin/node /usr/local/bin
    sudo ln -s /usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin/npm /usr/local/bin
    rm -rf node-$VERSION-$DISTRO.tar.xz
}



