# OS Init

setup your operating system automatically.

## How to

### Linux

#### install zsh and other tools

    $ USE_LOCAL=true sh linux/init.sh

#### setup zsh theme

    $ sh linux/setuptheme.sh {theme_name}
    $ source ~/.zshrc

#### batch init

    $ vim host.ini

add you hosts info

    $ tar -zcf batch/linux/init.tar.gz linux
    $ ansible-playbook -i batch/linux/hosts.ini batch/linux/init.yaml


### Debian

switch superuser.

    $ su

#### install zsh and other tools

    $ USE_LOCAL=true ./debian.sh

#### setup zsh theme

    $ sh common/setuptheme.sh {theme_name}
    $ source ~/.zshrc

see all [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes).

## References

### Installed tools

- Git
- zsh & oh-my-zsh
    - autojump
    - zsh-autosuggestions
- Node.js
- vim
    - [amix/vimrc](https://github.com/amix/vimrc.git)
- tree
- jq

