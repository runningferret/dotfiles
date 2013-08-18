#!/bin/sh
#Shamlessly stolen from https://github.com/vgod/vimrc
cd ~
ls -s dotfiles/.vim .vim 
ln -s dotfiles/.vim/vimrc .vimrc 
ln -s dotfiles/.vim/gvimrc .gvimrc 
