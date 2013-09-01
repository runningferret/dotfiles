#!/bin/bash
#Shamlessly stolen from https://github.com/vgod/vimrc
cd ~
if [ -h .vimrc ]
then
  mv .vimrc .vimrc.backup
  echo "Moved existing .vimrc to .vimrc.backup"
fi

ln -s dotfiles/vimrc .vimrc 
echo "Installed .vimrc!"

yes | vim +BundleInstall +qall
cd ~/.vim/bundle/command-t/ruby/command-t
rbenv local system
ruby extconf.rb
make clean
make
