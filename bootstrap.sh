#!/usr/bin/env zsh

if ! command -v rcup &> /dev/null; then
  sudo apt-get install -y rcm
fi

if ! command -v ag &> /dev/null; then
  sudo apt install silversearcher-ag
fi

if [ -f $HOME/.gitconfig ];then
  mv $HOME/.gitconfig $HOME/gitconfig.old
fi

if ! command -v gst &> /dev/null; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ -f $HOME/.zshrc ];then
  mv $HOME/.zshrc $HOME/zshrc.old
fi

env RCRC=$HOME/dotfiles/rcrc rcup
