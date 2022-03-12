#!/bin/bash

install_docker() {
    echo install docker...
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
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update
    apt-get install docker-ce docker-ce-cli containerd.io -y
}

