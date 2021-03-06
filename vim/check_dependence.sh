#!/usr/bin/env bash

error=0

echo -ne "检查vim...\t"
if ! type vim 2>&1 >/dev/null; then
  echo '警告'
else
  echo '成功'
fi

echo -ne "检查cmake...\t"
if ! type cmake 2>&1 >/dev/null; then
  echo '失败'
  error=1
else
  echo '成功'
fi

echo -ne "检查gcc...\t"
if ! type gcc 2>&1 >/dev/null; then
  echo '失败'
  error=1
else
  echo '成功'
fi

echo -ne "检查python-config...\t"
if ! type python-config 2>&1 >/dev/null; then
  echo '失败'
  error=1
else
  echo '成功'
fi

echo -ne "检查libclang.so...\t"
if [[ ! -e /usr/lib/libclang.so ]]; then
  echo '警告'
else
  echo '成功'
fi

if [[ 1 == $error ]]; then
  exit $error
fi

