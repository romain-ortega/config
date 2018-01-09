ZSH_THEME="agnoster"
ZSH=$HOME/.oh-my-zsh
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git brew)
PATH="~/.brew/opt/sqlite/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/opt/local/bin"
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export GOPATH='$HOME/golang'
export SSH_KEY_PATH="~/.ssh/dsa_id"
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export EDITOR=vim
export CC=gcc
export CCX=g++
autoload -U colors && colors

###############################################
# Alias
###############################################
alias vimrc='vim ~/.vimrc'
alias uuid='uuidgen'
alias pull='git pull'
alias add='git add'
alias push='git push'
alias commit='git commit -m'
alias zshrc="vim ~/.zshrc"
PROMPT="%{$fg[yellow]%}%~ %{$reset_color%}$ % "
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
MSG='auto'
alias gm="git commit -m \'auto\'"
alias gs="git stash"
alias gsp="git stash pop"
alias auto='make fclean; git add *; gm; git push'
alias gen="~/c/.project/gen"
alias c='clear'
alias s='cd ..'
alias ss='cd ../..'
alias m='mutt -y'
alias md='mkdir'
alias rd='rmdir'
alias upgrade='sudo softwareupdate -i -a'
alias rf='rm -rf'
case $TERM in
   xterm*)
       precmd () {print -Pn "\e]0;%n@%m: %~\a"}
       ;;
esac

if [ -x /usr/bin/dircolors ]
then
  if [ -r ~/.dir_colors ]
  then
    eval "`dircolors ~/.dir_colors`"
  elif [ -r /etc/dir_colors ]
  then
    eval "`dircolors /etc/dir_colors`"
  else
    eval "`dircolors`"
  fi
fi

setopt correct
setopt clobber
setopt ignore_eof
setopt print_exit_value
setopt glob_dots
setopt chase_links
setopt hist_verify
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home
unsetopt bg_nice
unsetopt hup

###############################################
# Trucs utiles
###############################################

###############################################
# Historique des commandes
###############################################

export HISTORY=10000
export SAVEHIST=100000
export HISTFILE=$HOME/.history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_save_no_dups

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
