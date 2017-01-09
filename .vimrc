set nocompatible " Be iMproved, required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

"*****************************************************************************
" Plugins list
"*****************************************************************************

Plug 'VundleVim/Vundle.vim'            " Let Vundle manage Vundle
Plug 'scrooloose/nerdtree'             " File tree
Plug 'scrooloose/nerdcommenter'        " Smart comments
Plug 'tpope/vim-fugitive'              " Git commands (:Gblame, :Gdiff, ..)
Plug 'ctrlpvim/ctrlp.vim'              " Find file easily
Plug 'vim-airline/vim-airline'         " Visual bar (at the bottom) and theme
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'          " Packages themes
Plug 'airblade/vim-gitgutter'          " Shows a git diff in the gutter (sign column) and stages/undoes hunks
Plug 'sheerun/vim-polyglot'            " A collection of language packs for Vim
Plug 'vim-scripts/CSApprox'            " Make gvim-only colorschemes work transparently in terminal vim
Plug 'bronson/vim-trailing-whitespace' " This plugin causes all trailing whitespace to be highlighted
Plug 'jiangmiao/auto-pairs'            " Insert or delete brackets, parens, quotes in pair
Plug 'majutsushi/tagbar'               " Tagbar displays the tags of the current file in a sidebar
Plug 'scrooloose/syntastic'            " Syntax checking hacks for vim
Plug 'terryma/vim-multiple-cursors'    " Multiple Cursors
Plug 'Yggdroot/indentLine'             " Display the indention levels with thin vertical lines
Plug 'Shougo/vimproc.vim'              " Interactive command execution in Vim
Plug 'xolox/vim-misc'                  " Vim Session (:SaveSession, :OpenSession, :CloseSession)
Plug 'xolox/vim-session'
Plug 'SirVer/ultisnips'                " Snippets
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'                    " Golang
Plug 'dsawardekar/ember.vim'           " Ember.js
Plug 'junegunn/vim-easy-align'         " Easy align
Plug 'sjl/gundo.vim'                   " Visualize Vim's undo tree
Plug 'suan/vim-instant-markdown'       " Live refresh when writing markdown
Plug 'yegappan/mru'                    " See most recent edited files
Plug 'mhinz/vim-startify'			   " Fancy start screen
Plug 'Shougo/vinarise.vim'			   " Ultimate hex editing system

" Custom
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator' " :YcmGenerateConfig /!\ CmakeList.txt
Plug 'mattn/emmet-vim' " <c-m><leader>
Plug 'michalliu/sourcebeautify.vim'

" Javascript
Plug 'moll/vim-node'
Plug 'jelera/vim-javascript-syntax'
Plug 'marijnh/tern_for_vim'
Plug 'burnettk/vim-angular'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

" CSS
Plug 'wavded/vim-stylus'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'gorodinskiy/vim-coloresque'

" HTML
Plug 'amirh/HTML-AutoCloseTag'
Plug 'tpope/vim-haml'
Plug 'digitaltoad/vim-jade'

call plug#end()
filetype plugin on
syntax on
let mapleader=","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight ColorColumn ctermbg=23
" set colorcolumn=79             " Vertical line 80 characters
set ruler                        " Show cursor position
set expandtab                    " Use spaces instead of tabs
set smarttab                     " Be smart when using tabs
set tabstop=4                    " Insert 2 spaces for a tab
set shiftwidth=4                 " Reindent by 2 spaces characters when using << or >>
set noet                         " Do not replace tab by spaces in insert mode
set mouse=a                      " Enable mouse
set clipboard=unnamed            " Use the system clipboard (not vim's)
" set nowrap                     " Stop lines breaking
set wrap                         " Word wrapping
set linebreak                    " Break line
set showbreak=⇇                  " Show ⇇ symbol between 2 breaking lines
set number                       " Show lines number
set noswapfile                   " No swap file
set backup                       " Turn backup on
set backupdir=$HOME/.vim/backups " Set backup files directory
set undofile                     " Turn persistent undo on
set undodir=$HOME/.vim/undo      " Set backup files directory
set lazyredraw                   " Don't redraw while executing macros
set hid
set si                           " Smart indent
set gdefault                     " Global replace by default
set hidden                       " Enable hidden buffers
set ttyfast                      " Fast key repeat
set binary                       " For editing binaries in a better way
set shell=/bin/zsh
set ttimeoutlen=100              " Set the timeout much shorter
set vb t_vb=                     " No beep warning

" Searching
" set hlsearch
set incsearch
set ignorecase
set smartcase

au BufNewFile * set noeol
au BufRead,BufNewFile *.go set filetype=go

" Run goimports every time a .go file is saved
:autocmd BufWritePost *.go :GoImports

" Run golint every time a .go file is saved
autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow

" make/cmake
augroup vimrc-make-cmake
		autocmd!
		autocmd FileType make setlocal noexpandtab
		autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" Source vimrc when saving
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always keep the cursor on the center
" nnoremap j jzz
" nnoremap k kzz

" Easily create new buffers
nmap <C-s-h>      :leftabove  vnew<cr>
nmap <C-s-l>      :rightbelow vnew<cr>
nmap <C-s-k>      :leftabove  new<cr>
nmap <C-s-j>      :rightbelow new<cr>

" Easily move between buffers
noremap <tab> <c-w><c-w>
noremap <s-tab> <c-w><c-h>

nnoremap <C-left> <C-W><C-J>
nnoremap <C-right> <C-W><C-K>
nnoremap <C-up> <C-W><C-L>
nnoremap <C-down> <C-W><C-H>

" Easily create new tabs
noremap t :tabnew<CR>

" Easily move between tabs
nmap <s-j> :tabp<cr>
nmap <s-k> :tabn<cr>
map <c-q> :tabclose<cr>

" Maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Press space in visual mode to closing/opening folds
vmap <space> zf
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Sessions management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" Launch go tests of the current folder
" map tt :GoTest<CR>

" Go to definition of a function
map gt :YcmCompleter GoTo<CR>

" Quick refactor
map rr :YcmCompleter RefactorRename<space>

" Quick `make re`
map mr :!make re<CR>

" Search with git grep
map gp :!git grep ""<left>

" Quick find
map gl :!git ls-files \| grep ""<left>

noremap <leader>b :CtrlPBuffer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Emmet
let g:user_emmet_leader_key='<c-m>' " Don't forgive to press leader then
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabDisabled = 1

" Syntastic <3
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_mode_map={"mode":"active", "active_filetypes": [], "passive_filetypes": []}
let g:syntastic_cpp_check_header = 1

" YouCompleteMe
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_accept_completion = ['<C-y>']
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_path_to_python_interpreter="/usr/bin/python"
let g:ycm_show_diagnostics_ui = 0
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1 " Ctags
let g:ycm_auto_start_csharp_server = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_filetype_blacklist = {
	\ 'tagbar' : 1,
	\ 'qf' : 1,
	\ 'notes' : 1,
	\ 'markdown' : 1,
	\ 'unite' : 1,
	\ 'text' : 1,
	\ 'vimwiki' : 1,
	\ 'pandoc' : 1,
	\ 'infolog' : 1,
	\ 'mail' : 1
\}

" Sessions
let g:session_directory = "~/.vim/session"
let g:session_command_aliases = 1
let g:session_autoload = "no"
let g:session_autosave = "no"

" NERDTree
map <C-e> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg', '\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']

" CtrlP
if executable('ag')
 " Use Ag over Grep
 set grepprg=ag\ --nogroup\ --nocolor

 " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
 let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_follow_symlinks = 2
let g:ctrlp_working_path_mode = 0
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" Tagbar
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
			\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" NERDcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
  \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType hbs,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Prevent UltiSnips from removing our carefully-crafted mappings.
let g:UltiSnipsMappingsToIgnore = ['autocomplete']

if has('autocmd')
  augroup WincentAutocomplete
    autocmd!
    autocmd! User UltiSnipsEnterFirstSnippet
    autocmd User UltiSnipsEnterFirstSnippet call autocomplete#setup_mappings()
    autocmd! User UltiSnipsExitLastSnippet
    autocmd User UltiSnipsExitLastSnippet call autocomplete#teardown_mappings()
  augroup END
endif

" Additional UltiSnips config.
let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = ['ultisnips']

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" Custom configs
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
autocmd!
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
augroup END

" Easy align
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

" Gundo
nnoremap <leader>gu :GundoToggle<cr>
let g:gundo_width=50

" InstantMarkdown
let g:instant_markdown_autostart = 1
let g:instant_markdown_slow = 1

" MRU
let MRU_Entries = 80
let MRU_File = $HOME . '/.vim/tmp/vim_mru_files'
map <leader>r :MRU<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep          = '▶'
let g:airline_left_alt_sep      = '»'
let g:airline_right_sep         = '◀'
let g:airline_right_alt_sep     = '«'
let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'
let g:airline_symbols.linenr    = '␊'
let g:airline_symbols.branch    = '⎇'
let g:airline_symbols.paste     = 'ρ'
let g:airline_symbols.paste     = 'Þ'
let g:airline_symbols.paste     = '∥'
let g:airline_symbols.whitespace = 'Ξ'
else
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
endif

let g:airline_theme = 'bubblegum'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler
set number
set mouse=a
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

" Macvim
if has("gui_running")
syntax on
" colorscheme one
" colorscheme material-theme
colorscheme lucario
set guioptions-=r
set guioptions-=R
set guioptions-=L
endif

let no_buffers_menu=1
if !exists('g:not_finsh_neobundle')
colorscheme Ronokai
set background=dark
endif

" Status bar
set laststatus=2

" Use modeline overrides
set modeline
set modelines=10
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
	set statusline+=%{fugitive#statusline()}
endif
