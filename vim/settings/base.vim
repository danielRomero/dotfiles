" Base configuration for vim
let mapleader="<Ctrl>"

syntax on
color dracula

set nocompatible            " Disable vi compatibility
filetype plugin indent on   " enable detection, plugins and indent

" --- history / file handling ---
set history=999             " Increase history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally

" searches
set hlsearch                " highlight searches
set incsearch               " show the `best match so far' astyped
set ignorecase smartcase    " make searches case-insensitive, unless they
                            "   contain upper-case letters

" --- remove sounds effects ---
set noerrorbells
set visualbell

set mouse=a                 " Enable mouse mode
set cursorline              " Highlight current line
set laststatus=2            " Always show status line
set number                  " Enable line numbers.
set showmatch               " show matching parenthesis
set title                   " Show the filename in the window title bar.
" set relativenumber
set nowrap                  " No wrap

" TABS and Scroll
set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftround
set splitbelow                                    " Open new split panes to right and bottom, which feels more natural
set splitright
set scrolloff=8                                   "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Quicker tab movement
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
