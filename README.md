# OS Init

Setup your operating system automatically.

## How to

### Linux(Depreacted)

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


### Linux

Notes that don't switch to superuser do via `sudo` because these are some packages(such as .vimrc, oh-my-zsh) only avaiable for user level(unless your really intend to install for superuser).

#### Install zsh and other tools

For Debian.

    $ ./debian.sh

For Ubuntu.

    $ ./ubuntu.sh

#### Setup zsh theme

    $ sh common/setuptheme.sh {theme_name}
    $ source ~/.zshrc

See all [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes).

## References

### Installed tools

- Git
- [zsh](https://www.zsh.org/) & [oh-my-zsh](https://ohmyz.sh/)
    - [autojump](https://github.com/wting/autojump)
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- Node.js
- [docker](https://www.docker.com)
- vim
    - [amix/vimrc](https://github.com/amix/vimrc.git)
- tree
- jq

