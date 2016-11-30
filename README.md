# config
Configuration for zsh, vim and more. Design for mac OS.

## Pre-requisites
Vim 7.3+ compiled with Python support, and Python 2.4+.
The distribution also requires macvim (with lua support), ctags, git, clang.  
For the most comfortable experience, use MacVim.  

To install macvim with lua support :  
`brew install macvim --with-cscope --with-lua --override-system-vim`

## Installation
`git clone https://github.com/romain-ortega/config.git /tmp/config && \
(cd /tmp/config && mv ~/.vimrc ~/.vimrc.old && mv ~/.vim/autoload ~/.vim/autoload.old && mv ~/.vim/bundle/ ~/.vim/bundle.old/)`

## Features
File tree and fuzzy search
![Preview](https://media.giphy.com/media/3o6Ztn4cYuskoSE0N2/source.gif)
***

See most recent files
![Preview](https://media.giphy.com/media/3o6Zt9QOGngcwGk5Rm/source.gif)
***

Live refresh and preview for markdown
![Preview](https://media.giphy.com/media/l0HlKsY05QvecJtSw/source.gif)
***

Easy folding with `<space>`
![Preview](https://media.giphy.com/media/3o6Zt7PuBBWFuuGs24/source.gif)
***

Easy align
![Preview](https://media.giphy.com/media/3o6Zto5DwboJpa1CrC/source.gif)
***

Vim undo tree in style with `<leader>gu`
![Preview](http://i.imgur.com/hmXlvfE.png)
***

Advanced syntax checking
![Preview](http://i.imgur.com/euBJJHX.png)
***

### Others
To have a better auto completion and IDE like features (Go to definition, declaration) you will need to exec these commands for every new project :  
`ctags -R --exclude=.git .`  
`:YcmGenerateConfig`
