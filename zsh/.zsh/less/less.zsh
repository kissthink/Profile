#!/usr/bin/zsh

# ======================== #
# alias for /usr/bin/less  #
# ======================== #
alias sysless='/usr/bin/less'

# ======================== #
# less 函数                #
# 用于替代系统less 指令    #
#             By iSpeller  #
# ======================== #
function less {
  local file_src=''
  local less_program=''

  if [[ -x /usr/bin/vim ]]; then
    less_program="/usr/bin/vim -c 'set nofoldenable' \
                                -c 'let no_plugin_maps = 1' \
                                -c 'runtime! macros/less.vim' "
  elif [[ -x /usr/bin/nano ]]; then
    less_program='/usr/bin/nano -v '
  else
    /usr/bin/less $@
    return $?
  fi

  if [[ 0 == $# ]]; then
    file_src='-'
    if [[ -t 0 ]]; then
      echo "Missing filename" >&2
      return 1
    fi
  else
    file_src='$@'
  fi

  if [[ ! -t 1 ]]; then
    if [[ 0 == $# ]]; then
      /usr/bin/cat
    else
      /usr/bin/cat $@
    fi
    return $?
  fi

  eval $less_program $file_src
  return $?
}

