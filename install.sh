#!/bin/sh

npm -g install instant-markdown-d && npm install -g typescript
# Check if Vundle exist, else install it
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall
