#!/usr/bin/env bash

error=0

echo -ne "检查git...\t"
if ! type git 2>&1 >/dev/null; then
  echo '警告。'
else
  echo '成功'
fi

if [[ 1 == $error ]]; then
  exit $error
fi

