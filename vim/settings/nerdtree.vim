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
