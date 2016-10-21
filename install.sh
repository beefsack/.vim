#!/bin/bash
set -e

if [ ! -d ~/.vim ]; then
  git clone https://github.com/beefsack/.vim.git ~/.vim
fi
if [ ! -e ~/.vimrc ]; then
  ln -s ~/.vim/.vimrc ~/.vimrc
fi
if [ ! -d ~/.config/nvim ]; then
  ln -s ~/.vim ~/.config/nvim
fi
