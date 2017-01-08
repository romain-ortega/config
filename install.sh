#!/bin/sh
git clone https://github.com/romain-ortega/config.git /tmp/config && (cd /tmp/config && mv ~/.vimrc ~/.vimrc.old && mv ~/.vim/autoload ~/.vim/autoload.old && mv ~/.vim/bundle/ ~/.vim/bundle.old/ && cp .vimrc ~/.vimrc)

mkdir -p ~/.vim/backups
brew install ctags node
mkdir ~/.vim/colors && cp colors/Ronokai.vim ~/.vim/colors
npm -g install instant-markdown-d && npm install -g typescript
mkdir $HOME/.vim/tmp

# Check if Vundle exist, else install it
if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
