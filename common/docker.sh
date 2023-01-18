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
        echo install docker via yum
        sudo yum install -y yum-utils
        sudo yum-config-manager \
            --add-repo \
            https://download.docker.com/linux/centos/docker-ce.repo
        sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
        sudo systemctl start docker
        return
    fi

    echo install docker via docker official script
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

