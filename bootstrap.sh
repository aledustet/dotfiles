#!/usr/bin/env zsh

if ! command -v rcup &> /dev/null; then
  sudo apt-get install -y rcm
fi

if [ ! -d $HOME/dotfiles-local ];then
  cp -r ./dotfiles-local $HOME
fi

env RCRC=$HOME/dotfiles/rcrc rcup
