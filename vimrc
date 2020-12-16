" AJAlabs Custom Vim Settings

" Use Vim settings, rather then Vi settings
" This must be first, because it changes other options as a side effect
set nocompatible

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

set nobackup
set nowritebackup
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" keep 100 lines of command line history
set history=100

" Turn Syntax Highlighting on
syntax on

" Switch wrap off for everything
set nowrap

" Remove end of file newlines
set noeol
set binary

" Set the Default Color Scheme/Theme
colorscheme ajalabs

" Use spaces instead of tabs
set expandtab
set smarttab

" Tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Always show current position
set ruler

" Enable mouse use in all modes
set mouse=v

" Ignore case when searching unless mixed case expressions
set ignorecase
set smartcase

" Maps autocomplete to tab
imap <Tab> <C-N>

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" Manage 'runtimepath' with pathogen.vim. Installs plugins and runtime files
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
filetype plugin indent on