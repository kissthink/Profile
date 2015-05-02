#!/usr/bin/zsh

# ======================== #
# 挂载函数                 #
#                          #
#             By iSpeller  #
# ======================== #

# fat32 分区挂载
function mountfat {
    /usr/bin/sudo /usr/bin/mount $1 $2 -o iocharset=utf8,umask=000
    return $?
}

# ntfs 分区挂载
function mountntfs {
  if [[ -f /bin/ntfs-3g ]]; then
    /usr/bin/sudo /bin/ntfs-3g $1 $2
  else
    mountfs $1 $2
  fi
  return $?
}

# iso 文件挂载
function mountiso {
  /usr/bin/mount $1 $2 -o loop
  return $?
}

# 目录挂载
function mountdir {
  /usr/bin/sudo /usr/bin/mount --bind $1 $2
  return $?
}

# 其他分区挂载
function mountfs {
  /usr/bin/sudo /usr/bin/mount $1 $2 -o noauto,async,noexec,rw
  return $?
}

# 卸载设备
function umount {
  /usr/bin/sudo /usr/bin/umount $1
  return $?
}

