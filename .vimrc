call plug#begin()
    Plug 'sheerun/vim-polyglot' " Better Syntax Support
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'scrooloose/NERDTree' " File Explorer 
    Plug 'jiangmiao/auto-pairs' " Auto pairs for '(' '[' '{'
    Plug 'vim-airline/vim-airline' " Status bar
    Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
    Plug 'ap/vim-css-color' " CSS Color Preview
	Plug 'ryanoasis/vim-devicons' " Developer Icons
call plug#end()

" NERDTree
let NERDTreeShowHidden=1
nnoremap <C-a> :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" My settings ...
set nocompatible
set timeoutlen=300
filetype on
filetype plugin on
filetype indent on
syntax on
set rnu 
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
