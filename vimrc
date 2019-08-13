let $PLUG_FILE = $HOME . "/.vim/settings/plugins.plug"

if filereadable($PLUG_FILE)
  source $PLUG_FILE
endif

" Function to source all .vim files in directory
function! SourceDirectory(file)
  for s:fpath in split(globpath(a:file, '*.vim'), '\n')
    exe 'source' s:fpath
  endfor
endfunction

call SourceDirectory('~/.vim/settings')
