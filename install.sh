# vim-plug: A minimalist Vim plugin manager.
# https://github.com/junegunn/vim-plug
plug_path=~/.vim/autoload/plug.vim
if test -f "$plug_path"; then
  echo "vim-plug is already installed"
else
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

#
