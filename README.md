# OS Init

Scripts for initialize os.

## How to

### install zsh and other tools

    $ USE_LOCAL=true sh linux/init.sh

### setup zsh theme

    $ sh linux/setuptheme.sh {theme_name}
    $ source ~/.zshrc


### batch init

    $ vim host.ini

add you hosts info

    $ tar -zcf batch/linux/init.tar.gz linux
    $ ansible-playbook -i batch/linux/hosts.ini batch/linux/init.yaml
