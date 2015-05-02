#!/usr/bin/env bash

suffix=$(date +%s)
[[ -z $curdir ]] && curdir=$(dirname $(readlink -f $0))

if [[ -d "$HOME/.mplayer" ]]; then
  if [[ -f "$HOME/.mplayer/config" || -L "$HOME/.mplayer/config" ]]; then
    mv "$HOME/.mplayer/config" "$HOME/.mplayer/config.${suffix}.bak"
  fi
else
  mkdir "$HOME/.mplayer"
fi

echo -ne "配置mplayer...\t"
ln -s "$curdir/config" "$HOME/.mplayer/config"
echo '完成'

