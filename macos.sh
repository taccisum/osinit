# 安装zsh（使用oh-my-zsh）

function install_zsh(){
    if [ ! -f /bin/zsh ];then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
        echo '检测到zsh已存在，如果需要重新安装请手动操作'
    fi
}

# $1: 要安装的插件
# $2：zsh插件启动命令 (>> ~/.zshrc)
function install_zsh_plugin(){
    brew install $1
    # check if zsh installed
    if [ -f /bin/zsh ] ;then
        row=$(cat ~/.zshrc | grep "$2")
        if [ ! -z "$row" ];then
            echo '检测到zsh已启用'$1'插件，将不做任何修改'
        else
            echo "$2" >> ~/.zshrc
        fi
    else
        echo '检测到zsh未安装，将自动进行安装'
        install_zsh
    fi
}

function brew_install(){
    echo '准备安装'$1' - by brew'
    brew install $1
}

function brew_cask_install(){
    echo '准备安装'$1' -  by brew cask'
    brew cask install $1
}


# 开发工具
tools=(
'git'
'macvim'
'tmux'
'tree'
'ccat'
'jq',
'gawk'
)

for tool in ${tools[@]};
do
    brew_install $tool
done

## python
brew_install python

## node及常用包
brew_install node
npm install -g n

## java
# brew cask install java # brew安装的java默认是最新版本，如果要安装jdk8应该手动下载

apps=(
'iterm2'
'docker'
'qlmarkdown'
'intellij-idea'
'sublime-text'
'vscode'
'visual-studio-code'
'visualvm'
'webstorm'
'postman'
'virtualbox'
# 'robo-3t' # brew下载不了，需要手动从官网下载
'alfred'
'qq'
'neteasemusic'
'dingtalk'
'cheatsheet'
'spectacle'
'flux'
'youdaodict'
'xmind'
'insomnia'
'wechat'
'the-unarchiver'
'thunder'
'mpv'
'skim'
)

for app in ${apps[@]};do
    brew_cask_install $app
done

# zsh plugins
install_zsh_plugin \
    'autojump' \
    "[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh"

install_zsh_plugin \
    'zsh-syntax-highlighting' \
    "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


# # privoxy
# brew install privoxy
# # 如何需要供局域网内其它设备访问，这里需要修改成该局域网的ip
# # 具体可参考https://wiki.archlinux.org/index.php/Privoxy_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
# # echo 'listen-address  {ip}:8118' >> /usr/local/etc/privoxy/config
# echo 'forward-socks5 / 127.0.0.1:1086 .' >> /usr/local/etc/privoxy/config
# # 启动privoxy服务
# brew services start privoxy

