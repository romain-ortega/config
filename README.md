# config
Configuration for zsh, vim and more. Designed for mac OS.

## Pre-requisites
Vim 7.3+ compiled with Python support, and Python 2.4+.
The distribution also requires macvim (with lua support), ctags, git, clang.  
For the most comfortable experience, use MacVim.  

To install macvim with lua support :  
`brew install macvim --with-cscope --with-lua --override-system-vim`

## Installation
Don't be scared, the installation script will keep your existing configuration safe.  
`bash <(curl -s https://raw.githubusercontent.com/romain-ortega/config/master/install.sh)`
  
Don't forget to configure YouCompleteMe. You can do it by executing this command :  
`(cd ~/.vim/bundle/YouCompleteMe && ./install.py --all)`

## Features
File tree and fuzzy search
[Preview](http://i.imgur.com/Qubq3LW.gif)
***

See most recent files
[Preview](http://i.imgur.com/Nf09Zq6.gif)
***

Live refresh and preview for markdown
[Preview](https://media.giphy.com/media/l0HlKsY05QvecJtSw/source.gif)
***

Easy folding with `<space>`
[Preview](http://i.imgur.com/oSEdI28.gif)
***

Easy align
[Preview](http://i.imgur.com/3g6WCja.gif)
***

Vim undo tree in style with `<leader>gu`
[Preview](http://i.imgur.com/hmXlvfE.png)
***

Advanced syntax checking
[Preview](http://i.imgur.com/euBJJHX.png)
***

Good autocompletion, go to declaration, go to definition and many more.
***

### Others
To have a better auto completion and IDE like features (Go to definition, declaration) you will need to exec these commands for every new project :  
`ctags -R --exclude=.git .`  
`:YcmGenerateConfig`

To load Iterm 2 preferences:  
`cp /tmp/config/com.googlecode.iterm2 ~/Desktop/com.googlecode.iterm2 && defaults read ~/Desktop/com.googlecode.iterm2 && killall cfprefsd`
