#!/bin/sh

curl https://raw.githubusercontent.com/beefsack/.vim/master/.vimrc > ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
