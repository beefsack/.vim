#!/bin/sh

curl https://raw.githubusercontent.com/beefsack/.vim/master/.vimrc > ~/.vimrc
mkdir -p ~/.vim/bundle
if [ ! -d "~/.vim/bundle/neobundle.vim" ]; then
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
