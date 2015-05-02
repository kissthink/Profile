#!/usr/bin/env bash

suffix=$(date +%s)
[[ -z $curdir ]] && curdir=$(dirname $(readlink -f $0))

[[ -f "$HOME/.nanorc" || -L "$HOME/.nanorc" ]] && mv "$HOME/.nanorc" "$HOME/.nanorc.${suffix}.bak"
[[ -d "$HOME/.nano" ||  -L "$HOME/.nano" ]] && mv "$HOME/.nano" "$HOME/.nano.${suffix}.bak"

echo -ne "配置nano...\t"
ln -s "$curdir/.nanorc" "$HOME/.nanorc"
ln -s "$curdir/.nano" "$HOME/.nano"
echo '完成'

