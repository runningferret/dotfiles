#!/bin/bash
#Shamlessly stolen from https://github.com/vgod/vimrc
cd ~
ls -s dotfiles/.vim .vim 
if [ -e .vimrc ]
then
  mv .vimrc .vimrc.backup
  echo "moved existing .vimrc to .vimrc.backup"
fi
if [ -e .gvimrc ]
then
  mv .gvimrc .gvimrc.backup
  echo "moved existing .gvimrc to .gvimrc.backup"
fi

ln -s dotfiles/.vim/vimrc .vimrc 
ln -s dotfiles/.vim/gvimrc .gvimrc 

yes | vim +BundleInstall +qall
cd ~/.vim/bundle/command-t/ruby/command-t
rbenv local system
ruby extconf.rb
make clean
make
