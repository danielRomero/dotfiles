"------------------ Base configuration for vim
let mapleader="'"

" enable syntax higlithing
syntax on

filetype plugin indent on
filetype on
filetype indent on

" show withespaces
set list
set listchars=space:·,trail:·,tab:--,extends:>,precedes:<

" coloscheme
color dracula
set termguicolors
let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

set nocompatible            " Disable vi compatibility
filetype plugin indent on   " enable detection, plugins and indent
set noshowmode              " Hide reduntant vim mode
set ttyfast                 " Speed up scrolling

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

" Mouse and cursor
set mouse=a                 " Enable mouse mode
set cursorline              " Highlight current line
set laststatus=2            " Always show status line

" line numbers and misc
set number                  " Enable line numbers.
set showmatch               " show matching parenthesis
set title                   " Show the filename in the window title bar.
" set relativenumber          " show relative line number
set nowrap                  " No wrap

" TABS and Scroll
set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftround
set splitbelow              " Open new split panes to right and bottom, which feels more natural
set splitright
set scrolloff=8             " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set expandtab

set backspace=indent,eol,start

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Quicker tab movement
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>

" Save shortcuts ?????????
nnoremap <Leader>x :x<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>s :update<cr>
nnoremap <C-s> :update<cr>

" Quit shortcuts ??????????
inoremap <C-Q> <esc>:q<cr>
nnoremap <C-Q> :q<cr>
vnoremap <C-Q> <esc>

inoremap <C-w> <esc>:q<cr>
nnoremap <C-w> :q<cr>
vnoremap <C-w> <esc>

" ---------- PLUGINS CONFIGURATION ----------

" --- ALE
nnoremap <Leader>a :ALEFix<cr>
let g:ale_set_loclist = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

augroup elixir
  nnoremap <leader>r :! elixir %<cr>
  autocmd FileType elixir nnoremap <c-]> :ALEGoToDefinition<cr>
augroup END

let g:ale_linters = {}
let g:ale_linters.elixir = ['elixir-ls', 'credo']
let g:ale_linters.ruby = ['rubocop', 'ruby']

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.ruby = ['rubocop']
let g:ale_fixers.elixir = ['mix_format']

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_elixir_elixir_ls_release = '~/vim/elixir-ls/rel'
let g:ale_sign_column_always = 1

" --- NerdTree

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcuts to open NERDTree
nnoremap <Leader>t :NERDTreeToggle<RETURN>
nnoremap <Leader>e :NERDTreeFind<RETURN>

" Show hidden by default in NerdTree
let NERDTreeShowHidden = 1
let g:NERDTreeHighlightCursorline = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" --- AG (the silver searcher)
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

" --- FzF as fuzzy finder inside VIM
if executable('fzf')
  nnoremap <C-p> :FZF<RETURN>
  set rtp+=~/.fzf
endif

let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" --- Lightline

let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" --- GitGutter

set updatetime=1000 " update time interval 1 second
