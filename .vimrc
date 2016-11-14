" [quantity] [operation] [movement]
execute pathogen#infect()
set nocompatible
filetype off
syntax on

filetype plugin indent on

let mapleader=","

highlight ColorColumn ctermbg=23
set colorcolumn=80		" Vertical line 80 characters
" set noet 			" Do not replace tab by spaces in insert mode
set expandtab			" Convert tab to spaces
set ruler			" Show cursor position
set tabstop=2			" Insert 2 spaces for a tab
set shiftwidth=2		" Reindent by 2 spaces characters when using << or >>
set mouse=a			" Enable mouse
set clipboard=unnamed 		" Use the system clipboard (not vim's)
set encoding=utf-8 		" Use utf-8
" set nowrap 			" Stop lines breaking
set wrap 			" Word wrapping
set linebreak 			" Break line
set showbreak=⇇ 		" Show ⇇ symbol between 2 breaking lines
set number 			" Show lines number
set noswapfile 			" Don't save buffer change to a swap file
set nobackup 			" No backup file (tmp file with ~)
set ignorecase
set smartcase 			" Smart case when searching
set lazyredraw
set hid
set si                		" Smart indent

" Launch go tests of the current folder
" map tt :GoTest<CR>

" Go to the definition of a go function (<3)
map ff :GoDef<CR>

map mm :!make re<CR>
map gp :!git grep ""<left>

" Run goimports binary every time a .go file is saved
:autocmd BufWritePost *.go :GoImports

" Run golint binary every time a .go file is saved
" autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Autocomplete with tab:
let g:SuperTabDefaultCompletionType = "<c-n>"

" UltiSnips
" let g:UltiSnipsExpandTrigger="<tab>"


" Cursor line:
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
" highlight CursorLine guibg=#262838 ctermbg=darkgray
" highlight Visual guibg=#262838 ctermbg=darkgray

" Automatic formatting:
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.hbs :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e

au BufNewFile * set noeol
au BufRead,BufNewFile *.go set filetype=go

" No show command:
autocmd VimEnter * set nosc

" Always keep the cursor on the center
" nnoremap j jzz
" nnoremap k kzz

" Buffers:
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

" Tab:
" Easily create new tabs
noremap t :tabnew<CR>

"Easily move between tabs
nmap <s-j> :tabp<cr>
nmap <s-k> :tabn<cr>

" NERDTree:
map <C-e> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" CtrlP:
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
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

" Tagbar:
map <C-q> :TagbarToggle<CR>
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

" json:
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
        autocmd!
        autocmd FileType json set autoindent
        autocmd FileType json set formatoptions=tcq2l
        autocmd FileType json set textwidth=78 shiftwidth=2
        autocmd FileType json set softtabstop=2 tabstop=2
        autocmd FileType json set expandtab
        autocmd FileType json set foldmethod=syntax
augroup END

" NERDcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Neocomplcache

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

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
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

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

" Syntastic <3
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_highlighting = 0
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_mode_map={"mode":"active", "active_filetypes": [], "passive_filetypes": []}

" YouCompleteMe
let g:ycm_path_to_python_interpreter="/usr/bin/python"
let g:ycm_show_diagnostics_ui = 0
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
