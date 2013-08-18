#!/bin/sh
#Shamlessly stolen from https://github.com/vgod/vimrc
VIMHOME=~/.vim
DOTFILESHOME=~/dotfiles
VUNDLEHOME=~/.vim/bundle/vundle

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

git clone git://github.com/runningferret/dotfiles "$DOTFILESHOME"
cd "$DOTFILESHOME" && git pull
git clone https://github.com/gmarik/vundle.git "$VUNDLEHOME"
cd "$VUNDLEHOME" && git pull

cd $DOTFILESHOME
for script in `ls install-*`
do
  echo "Running $script"
  ./$script
done
# ./install-vim.sh

