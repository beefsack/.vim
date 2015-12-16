#!/bin/sh

curl https://raw.githubusercontent.com/beefsack/.vim/master/.vimrc > "$HOME/.vimrc"
mkdir -p ~/.vim/bundle
if [ ! -d "$HOME/.vim/bundle/neobundle.vim" ]; then
  git clone https://github.com/Shougo/neobundle.vim "$HOME/.vim/bundle/neobundle.vim"
fi
