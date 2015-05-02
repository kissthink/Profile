#!/usr/bin/env bash

# oh-my-zsh
if [[ ! -d "$HOME/.oh-my-zsh" ]];then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# zsh-syntax-highlighting
if [[ ! -d  ~/.zsh/zsh-syntax-highlighting ]];then
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi

