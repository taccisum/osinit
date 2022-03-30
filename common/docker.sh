#!/bin/bash

install_docker() {
    os=${1:-debian}
    echo install docker for $os...
    which docker >> /dev/null;
    if [ $? -eq 0 ];then
        echo [skip] docker has installed
        return
    fi

    which yum >> /dev/null;
    if [ $? -eq 0 ];then
        echo [skip] install docker via yum is not supported yet.
        return
    fi

    install ca-certificates
    install gnupg
    install lsb-release
    curl -fsSL https://download.docker.com/linux/$os/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/$os \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
}

