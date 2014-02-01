#!/bin/bash
#Shamlessly stolen from https://github.com/vgod/vimrc
cd ~
if [ -e .vimrc ]
then
  mv .vimrc .vimrc.backup
  echo "Moved existing .vimrc to .vimrc.backup"
fi

ln -s dotfiles/vimrc .vimrc 
echo "Installed .vimrc!"

if [[ `brew list` =~ 'ctags' ]]
then
  echo "Skipping... ctags already installed"
else
  brew install ctags
fi

if [[ `brew list` =~ 'vim' ]]
then
  echo "Skipping... vim already installed"
else
  brew install vim
fi

yes | vim +BundleInstall +qall
