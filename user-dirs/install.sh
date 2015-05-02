#!/usr/bin/env bash

suffix=$(date +%s)
[[ -z $curdir ]] && curdir=$(dirname $(readlink -f $0))

if [[ -d "$HOME/.config" ]]; then
  if [[ -f "$HOME/.config/user-dirs.dirs" || -L "$HOME/.config/user-dirs.dirs" ]]; then
    mv "$HOME/.config/user-dirs.dirs" "$HOME/.config/user-dirs.dirs.${suffix}.bak"
  fi
  if [[ -f "$HOME/.config/user-dirs.locale" || -L "$HOME/.config/user-dirs.locale" ]]; then
    mv "$HOME/.config/user-dirs.locale" "$HOME/.config/user-dirs.locale.${suffix}.bak"
  fi
else
  mkdir "$HOME/.config"
fi

echo -ne "配置user-dirs...\t"
ln -s "$curdir/user-dirs.dirs" "$HOME/.config/user-dirs.dirs"
ln -s "$curdir/user-dirs.locale" "$HOME/.config/user-dirs.locale"
echo '完成'

