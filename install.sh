#!/bin/bash
set -e

if [ ! -d ~/.vim ]; then
  git clone https://github.com/beefsack/.vim.git ~/.vim
fi
if [ ! -e ~/.vimrc ]; then
  ln -s ~/.vim/.vimrc ~/.vimrc
fi
if [ ! -d ~/.dein ]; then
  bash <(curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh) ~/.dein
fi
