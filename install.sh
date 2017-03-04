#!/bin/sh
usage() {
	echo "Available options:
	-v [ --vimrc ]         install vimrc configuration
	-z [ --zshrc ]         install zshrc configuration
	-i [ --iterm ]         configure iterm2
	-a [ --all ]           configure everything";
  # -f [ --force  ]        override if necessary";
	exit
}
command_exists() {
	type "$1" &> /dev/null ;
}

# No argument
if [[ $# -eq 0 ]] ; then
	usage
fi

# Read argument(s)
for i in "$@"
do
case $i in
    -v|--vimrc)
    VIMRC=true
    shift
    ;;
    -z|--zshrc)
    ZSHRC=true
    shift
    ;;
    -i|--iterm)
    ITERM=true
    shift
    ;;
    -a|--all)
    VIMRC=true
    ZSHRC=true
	ITERM=true
    shift
    ;;
	# -b=*|--brew=*)
	# BREW="${i#*=}"
	# shift
	# ;;
    *) # unknown option
	usage;
    ;;
esac
done

if [[ "$VIMRC" = true ]]; then
	# Check if brew is installed, else install it
	if ! command_exists brew ; then
	  # Install brew here
	  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	brew install node
	brew install cmake
	brew install macvim --with-cscope --with-lua --override-system-vim
	git clone https://github.com/romain-ortega/config.git /tmp/config && cd /tmp/config && \
		mv ~/.vimrc ~/.vimrc.old && mv ~/.vim/autoload ~/.vim/autoload.old && \
		mv ~/.vim/bundle/ ~/.vim/bundle.old/
	mkdir -p ~/.vim/backups
	cd /tmp/config && cp .vimrc ~/.vimrc
	mkdir ~/.vim/colors
	cp colors/Ronokai.vim ~/.vim/colors
	cp colors/lucario.vim ~/.vim/colors
	npm -g install instant-markdown-d && npm install -g typescript && npm install -g tern
	brew install ctags
	mkdir $HOME/.vim/tmp
	cp -r ultisnips ~/.vim/ultisnips
	cp -r plugin ~/.vim/plugin
	mkdir ~/.vim/autoload
	cp autocomplete.vim ~/.vim/autoload
	cp .ycm_extra_conf.py ~/.ycm_extra_conf.py
	cp .ycm_extra_conf.py /.ycm_extra_conf.py

	# Check if Vundle exist, else install it
	if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
		git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
	fi
	vim +PluginInstall! +qall
	(cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --tern-completer)
fi
if [[ "$ZSHRC" = true ]]; then
	mv ~/.zshrc ~/.zshrc.old
	cp .zshrc ~/.zshrc
	# Install zsh plugins
	if [[ ! -d $HOME/.oh-my-zsh ]]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi
	mkdir ~/.oh-my-zsh/plugins
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins
	echo "source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> \
		${ZDOTDIR:-$HOME}/.zshrc
fi
if [[ "$ITERM" = true ]]; then
	cp /tmp/config/com.googlecode.iterm2 ~/Desktop/com.googlecode.iterm2 && \
		defaults read ~/Desktop/com.googlecode.iterm2 && killall cfprefsd
fi
