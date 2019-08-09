vim_config_file=~/.vimrc
if test -f "$vim_config_file"; then
  echo "vim config file already exists"
else
  touch $vim_config_file
fi
