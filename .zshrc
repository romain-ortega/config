###############################################
# Oh My Zsh plugins
###############################################
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(
	git
	brew
	git-flow
	docker
	colored-man-pages
	git-auto-fetch
	heroku
)

###############################################
# Env
###############################################
ZSH_THEME="agnoster"
ZSH=$HOME/.oh-my-zsh
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git brew)
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/opt/local/bin:~/.nvm/versions/node/v7.10.0/lib/node_modules/node/bin"
export PATH="$PATH:/Users/macbook/Documents/.nvm/versions/node/v7.10.0/lib/node_modules/node/bin/"
alias migrate-mongo="/Users/macbook/Documents/.nvm/versions/node/v7.10.0/lib/node_modules/node/bin/migrate-mongo"
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

###############################################
# Prompt
###############################################
git_prompt() {
  branch=$(git branch | awk '/^\*/ { print $2 }')
  echo $branch
}

precmd() {
	PROMPT="%{$fg[yellow]%}%~ %{$fg[blue]%}% $(git_prompt)%  %{$reset_color%}$ % "
}

PROMPT="%{$fg[yellow]%}%~ %{$fg[blue]%}% $(git_prompt)%  %{$reset_color%}$ % "


###############################################
# Git                                    #
###############################################
alias glg="git log --pretty=format:'%C(yellow)%h%Creset -%C(bold red)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --graph"
alias gsp="git stash pop"

###############################################
# Alias
###############################################
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,node_modules,.nyc_output,.tags}'
alias vimrc='vim ~/.vimrc'
alias zshrc="vim ~/.zshrc"
alias uuid='uuidgen'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias c='clear'
alias s='cd ..'
alias ss='cd ../..'
alias upgrade='sudo softwareupdate -i -a'
alias rf='rm -rf'

###############################################
# Colors
###############################################
autoload -U colors && colors
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

###############################################
# ZSH options
###############################################
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
# Historic
###############################################
export HISTORY=10000
export SAVEHIST=100000
export HISTFILE=$HOME/.history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_save_no_dups

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
