#!/bin/sh
#Shamlessly stolen from https://github.com/vgod/vimrc
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

# git clone git://github.com/runningferret/vimrc "$VIMHOME"
git clone git://github.com/runningferret/dotfiles ~/dotfiles

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

./install-vim.sh
