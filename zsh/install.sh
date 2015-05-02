#!/usr/bin/env bash

suffix=$(date +%s)
[[ -z $curdir ]] && curdir=$(dirname $(readlink -f $0))

[[ ! -d $HOME/.zsh/mount_function ]] &&  mkdir -p $HOME/.zsh/mount_function
[[ ! -d $HOME/.zsh/less ]] &&  mkdir -p $HOME/.zsh/less
[[ ! -d $HOME/.zsh/archpkg ]] && mkdir -p $HOME/.zsh/archpkg
[[ ! -d $HOME/.zsh/alias ]] && mkdir -p $HOME/.zsh/alias
[[ -f "$HOME/.zshrc" || -L "$HOME/.zshrc" ]] && mv "$HOME/.zshrc" "$HOME/.zshrc.${suffix}.bak"

echo -ne "配置zsh...\t"
ln -s "$curdir/.zshrc" "$HOME/.zshrc"
ln -sf "$curdir/.zsh/mount_function/mount_function.zsh" "$HOME/.zsh/mount_function/mount_function.zsh"
ln -sf "$curdir/.zsh/less/less.zsh" "$HOME/.zsh/less/less.zsh"
ln -sf "$curdir/.zsh/archpkg/archpkg.zsh" "$HOME/.zsh/archpkg/archpkg.zsh"
ln -sf "$curdir/.zsh/alias/alias.zsh" "$HOME/.zsh/alias/alias.zsh"
echo '完成'

