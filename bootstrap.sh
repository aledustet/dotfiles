#!/usr/bin/env zsh

if ! command -v rcup &> /dev/null; then
  sudo apt-get install -y rcm
fi

if [ ! -d $HOME/dotfiles-local ];then
  cp -r ./dotfiles-local $HOME
fi

if ! command -v gst &> /dev/null; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

env RCRC=$HOME/dotfiles/rcrc rcup
