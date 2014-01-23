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
if [[ `brew list` =~ 'git' ]]
then
  echo "Skipping... git already installed"
else
  brew install git
fi

if [ -e "${VIMHOME}" ]
then
  mv $VIMHOME $VIMHOME.bak
  echo "Moved existing $VIMHOME to $VIMHOME.bak"
  mkdir $VIMHOME
  echo "Created $VIMHOME"
fi

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
