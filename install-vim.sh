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

yes | vim +BundleInstall +qall

if [[ `brew list` =~ 'ctags' ]]
then
  echo "Skipping... ctags already installed"
else
  brew install ctags
fi
