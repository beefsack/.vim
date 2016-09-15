#!/bin/bash

curl https://raw.githubusercontent.com/beefsack/.vim/master/.vimrc > ~/.vimrc
if [ ! -d ~/.dein ]; then
  bash <(curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh) ~/.dein
fi
