# config
Configuration for zsh, vim and more. Design for mac OS.

## Pre-requisites
Vim 7.3+ compiled with Python support, and Python 2.4+.
The distribution also requires macvim (with lua support), ctags, git, clang.  
For the most comfortable experience, the MacVim.  

To install macvim with lua support :  
`brew install macvim --with-cscope --with-lua --override-system-vim`

## Installation
`git clone https://github.com/romain-ortega/config.git /tmp/config && \
(cd /tmp/config && mv ~/.vimrc ~/.vimrc.old && mv ~/.vim/autoload ~/.vim/autoload.old && mv ~/.vim/bundle/ ~/.vim/bundle.old/)`

## Features
File tree and fuzzy search
![Preview](https://raw.githubusercontent.com/romain-ortega/config/master/img/filetree_fuzzysearch.gif)
***

See most recent files
![Preview](https://raw.githubusercontent.com/romain-ortega/config/master/img/mru.gif)
***

Live refresh and preview for markdown
![Preview](https://raw.githubusercontent.com/romain-ortega/config/master/img/instant_markdown_preview.gif)
***

Easy folding with `<space>`
![Preview](https://raw.githubusercontent.com/romain-ortega/config/master/img/fold.gif)
***

Vim undo tree in style
![Preview](https://raw.githubusercontent.com/romain-ortega/config/master/img/gundo.png)
***

Advanced syntax checking
![Preview](https://raw.githubusercontent.com/romain-ortega/config/master/img/syntax_check.png)
***

### Others
To have a better auto completion and IDE like features (Go to definition, declaration) you will need to exec these commands for every new project :  
`ctags -R --exclude=.git .`  
`:YcmGenerateConfig`
