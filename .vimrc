autocmd! bufwritepost vimrc source %
filetype off
autocmd! VimEnter nohlsearch
set nowrap
set encoding=utf-8             " display wierd characters

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.dotfiles/vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!  
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Shougo/neocomplcache'
Bundle 'Lokaltog/vim-powerline'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
" Bundle 'vim-scripts/pydoc.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'klen/python-mode'
Bundle 'Raimondi/delimitMate'
Bundle 'lukerandall/haskellmode-vim'

" snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

Bundle 'L9'
Bundle 'FuzzyFinder'

Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'

filetype plugin indent on     " required!

" set tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" remap tab stuff
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>
:nnoremap <C-a> :tabe<CR>

" powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2
set term=screen-256color

" gundo
nnoremap <F5> :GundoToggle<CR>

set number
set relativenumber

let g:acp_enableAtStartup = 0

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
au BufEnter * inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" haskell
au BufEnter *.hs compiler ghc

" change colors
highlight Pmenu guibg=blackboard gui=bold

" keep select on indent
vnoremap < <gv
vnoremap > >gv

" copy/paste
set pastetoggle=<F2>
set clipboard=unnamed

" allow mouse movements
set mouse=a

" leader character remap
let mapleader = ","

" sort cmd
vnoremap <Leader>s :sort<CR>

" set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline

" solarized color scheme
" syntax enable
" set background=dark
" let g:solarized_termcolors=256
colorscheme slate

" remap split screen movements
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" regex settings
set ignorecase

" search while typing
set incsearch

" dont backup where I can see it
set backupdir=~/tmp

" pymode options
let g:pymode_lint_onfly = 1
let g:pymode_rope_vim_completion = 1
let g:pymode_rope = 0
let g:pymode_lint_cwindow = 0
nnoremap <C-g> :PyLintAuto<CR>
let g:pymode_lint_checker = "pylint,pyflakes,pep8,mccabe"

" make a better escape
inoremap <C-f> <Esc>

" nerd tree specific
" autocmd vimenter * NERDTree " auto start nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
