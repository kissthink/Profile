# =========================
# zshrc 配置文件
# =========================
# 位置: ~/.zshrc
#           By iSpeller
# =========================

# =========================
# Say Hello ^_^
# =========================
if type fortune >/dev/null 2>&1; then
  if type cowsay >/dev/null 2>&1; then
    cowsay -f tux "$(fortune)"
  else
    fortune
  fi
else
  if type cowsay >/dev/null 2>&1; then
    cowsay -f tux "Hi $(whoami) ^_^"
  else
    echo "Hi $(whoami) ^_^"
  fi
fi

# =========================
# oh-my-zsh 路径
# =========================
# 优先使用~ 下的oh-my-zsh
# =========================
ZSH=/usr/share/oh-my-zsh
[[ -d $HOME/.oh-my-zsh ]] && ZSH=$HOME/.oh-my-zsh

# =========================
# PROMPT - 注释了一些不错的
# =========================
#ZSH_THEME='robbyrussell'
#ZSH_THEME='blinks'
#ZSH_THEME='dstufft'
ZSH_THEME='af-magic'
#ZSH_THEME='ys'
#ZSH_THEME='tjkirch'

# =========================
# oh-my-zsh 插件
# =========================
plugins=(
  battery colorize common-aliases dirhistory
  history-substring-search jump gnu-utils per-directory-history
  perl python sudo themes torrent textmate web-search
)
if [[ -w $ZSH ]]; then
  plugins+=zsh_reload
  [[ ! -d "$ZSH/cache" ]] && /bin/mkdir "$ZSH/cache"
fi
[[ -s /usr/bin/rsync ]] && plugins+=(cp rsync)
[[ -s /usr/bin/ruby ]] && plugins+=ruby
[[ -s /usr/bin/tmux ]] && plugins+=tmux
[[ -s /usr/bin/git ]] && plugins+=(git github git-prompt git-extras)
[[ -s /usr/bin/svn ]] && plugins+=(svn svn-fast-info)
[[ -s /usr/bin/gvim ]] && plugins+=vim-interaction
[[ -s /usr/bin/autojump ]] && plugins+=autojump
type pacman-key >/dev/null 2>&1 && plugins+=archlinux
type apt-get >/dev/null 2>&1 && plugins+=debian
type yum >/dev/null 2>&1 && plugins+=yum
type zypper >/dev/null 2>&1 && plugins+=suse
type systemctl >/dev/null 2>&1 && plugins+=systemd

# =========================
# oh-my-zsh 自动更新
# =========================
# 关闭oh-my-zsh 自带的定期更新
# 当$ZSH 目录有写权限时提供更新指令
# =========================
DISABLE_AUTO_UPDATE="true"
if [[ -w "$ZSH/.git" ]]; then
  alias oh-my-zsh-upgrade="cd $ZSH/tools; zsh $ZSH/tools/upgrade.sh; cd $OLDPWD"
fi

# ========================
# 其他oh-my-zsh 设置
# ========================
# 日期格式，合法间隔包括'/'、'.' 和'-'
HIST_STAMPS="yyyy-mm-dd"
# 大小写敏感？
CASE_SENSITIVE="false"
# 禁止自动设置终端标题？
DISABLE_AUTO_TITLE="false"
# 补全等待时显示红点？
COMPLETION_WAITING_DOTS="true"
# 允许自动改错？
ENABLE_CORRECTION="false"
# Disable marking untracked files under VCS as dirty ?
# This makes repository status check for large repositories faster.
DISABLE_UNTRACKED_FILES_DIRTY="false"

# =========================
# 环境变量
# =========================
# 增加了一些特殊位置的bin 目录
# 增加了当前目录(但优先级最低)
path+=($HOME/bin /usr/local/bin)
[[ -s /usr/bin/gem ]] && path+=($(ruby -rubygems -e 'puts Gem.user_dir')/bin)
export GOPATH=$HOME/lib/go
path+=$GOPATH/bin
path+=.
# 额外的man 手册路径
manpath+=/usr/local/man
# 编译的架构参数
ARCHFLAGS='-arch x86_64'
# ssh key
SSH_KEY_PATH='~/.ssh/id_rsa'
# 默认编辑器
export EDITOR="/usr/bin/vim"
# 终端256 色
TERM="xterm-256color"

# =========================
# 装载主题和插件
# =========================
if [[ -r $ZSH/oh-my-zsh.sh ]]; then
  source $ZSH/oh-my-zsh.sh
fi

# =========================
# 自动补全设置
# =========================
zstyle ':completion:*' verbose true
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# =========================
# zsh-syntax-higlighting
# =========================
if [[ -d /usr/share/zsh/plugins/zsh-syntax-highlighting ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/*.zsh
elif [[ -d $HOME/.zsh/zsh-syntax-highlighting ]]; then
  source $HOME/.zsh/zsh-syntax-highlighting/*.zsh
fi

# =========================
# tmux
# =========================
# 建议在ssh 的环境（而非X11）下启用
# =========================
# 保持各种端tmux 的一致性，建议在远程主机上的私人账户上开启
#[[ -f /usr/bin/tmux && -z "$TMUX" ]] && (TERM=xterm-256color && tmux attach || tmux -2) && exit
# =========================
# 启用tmux 但不保持各终端一致性，建议在远程主机的公共账户上开启
#[[ -f /usr/bin/tmux && -z "$TMUX" ]] && (TERM=xterm-256color && tmux -2) && exit

# ========================
# 挂载函数
# ========================
if [[ -r $HOME/.zsh/mount_function/mount_function.zsh ]]; then
  source $HOME/.zsh/mount_function/mount_function.zsh
fi

# ========================
# less 函数
# ========================
if [[ -r $HOME/.zsh/less/less.zsh ]]; then
  source $HOME/.zsh/less/less.zsh
fi

# ========================
# archpkg 函数
# ========================
if [[ -r $HOME/.zsh/archpkg/archpkg.zsh ]]; then
  source $HOME/.zsh/archpkg/archpkg.zsh
fi

# ========================
# alias
# ========================
if [[ -r $HOME/.zsh/alias/alias.zsh ]]; then
  source $HOME/.zsh/alias/alias.zsh
fi

