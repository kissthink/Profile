#!/usr/bin/env bash

suffix=$(date +%s)
[[ -z $curdir ]] && curdir=$(dirname $(readlink -f $0))

if [[ -d "$HOME/.config/terminator" ]]; then
  if [[ -f "$HOME/.config/terminator/config" || -L "$HOME/.config/terminator/config" ]]; then
    mv "$HOME/.config/terminator/config" "$HOME/.config/terminator/config.$suffix.bak"
  fi
else
  mkdir "$HOME/.config/terminator"
fi

echo -ne "配置terminator...\t"
ln -sf "$curdir/config" "$HOME/.config/terminator/config"
echo '完成'