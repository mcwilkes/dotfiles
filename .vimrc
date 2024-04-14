" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin()
    Plug 'sheerun/vim-polyglot' " Better Syntax Support
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'scrooloose/NERDTree' " File Explorer 
    Plug 'jiangmiao/auto-pairs' " Auto pairs for '(' '[' '{'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline' " Status bar
    Plug 'vim-airline/vim-airline-themes'
    Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
    Plug 'ap/vim-css-color' " CSS Color Preview
	Plug 'ryanoasis/vim-devicons' " Developer Icons
    Plug 'mattn/emmet-vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-commentary'
    Plug 'ervandew/supertab'
    Plug 'liuchengxu/vim-which-key'
    Plug 'mhinz/vim-startify'
    Plug 'garbas/vim-snipmate'
    Plug 'MarcWeber/vim-addon-mw-utils'
call plug#end()
" }}}

" NERDTree settings ------------------------------------------------------ {{{
let NERDTreeShowHidden=1
nnoremap <C-a> :NERDTreeToggle<CR>
" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" }}}

" vim-airline ------------------------------------------------------------ {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
" }}}

" load which-key settings, mappings ...
source ~/.vim/custom/which-key.vim

" My Settings ------------------------------------------------------------ {{{
set nocompatible
set timeoutlen=300
filetype on
filetype plugin on
filetype indent on
syntax on
colo habamax
set rnu 
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set updatetime=100
set scl=auto
set nowrap
set incsearch
set ignorecase
set smartcase
set cursorline
set cursorcolumn
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
