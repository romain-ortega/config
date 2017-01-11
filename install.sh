#!/bin/sh
git clone https://github.com/romain-ortega/config.git /tmp/config && cd /tmp/config && mv ~/.vimrc ~/.vimrc.old && mv ~/.vim/autoload ~/.vim/autoload.old && mv ~/.vim/bundle/ ~/.vim/bundle.old/

mkdir -p ~/.vim/backups
cp .vimrc ~/.vimrc
mkdir ~/.vim/colors
cp colors/Ronokai.vim ~/.vim/colors
npm -g install instant-markdown-d && npm install -g typescript
brew install ctags
mkdir $HOME/.vim/tmp
cp -r ultisnips ~/.vim/ultisnips
mkdir ~/.vim/autoload
cp autocomplete.vim ~/.vim/autoload
cp .ycm_extra_conf.py ~/.ycm_extra_conf.py
cp .ycm_extra_conf.py /.ycm_extra_conf.py

# Check if Vundle exist, else install it
if [[ ! -d $HOME/.vim/bundle/Vundle.vim ]]; then
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
vim +PluginInstall! +qall
