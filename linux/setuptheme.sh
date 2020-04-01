#!/bin/sh

sed -i 's/ZSH_THEME=".*"/ZSH_THEME="'$1'"/' ~/.zshrc
