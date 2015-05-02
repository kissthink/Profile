#!/usr/bin/env bash

suffix=$(date +%s)
[[ -z $curdir ]] && curdir=$(dirname $(readlink -f $0))

[[ -f "$HOME/.toprc" || -L "$HOME/.toprc" ]] && mv "$HOME/.toprc" "$HOME/.toprc.${suffix}.bak"

echo -ne "配置top...\t"
ln -s "$curdir/.toprc" "$HOME/.toprc"
echo '完成'

