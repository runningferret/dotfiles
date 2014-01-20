#!/bin/sh
cd ~/dotfiles
git remote set-url origin https://github.com/runningferret/dotfiles.git

cd ~
if [ -h .gitconfig ]
then
  mc .gitconfig .gitconfig.backup
  echo "Moved existing .gitconfig to .gitconfig.backup"
fi

ln -s dotfiles/gitconfig .gitconfig
echo "Installed .gitconfig!"

