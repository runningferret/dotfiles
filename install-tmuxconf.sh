#!/bin/sh

cd ~
if [ -h .tmux.conf ]
then
  mv .tmux.conf .tmux.conf.backup
  echo "Moved existing .tmux.conf to .tmux.conf.backup"
fi

ln -s dotfiles/tmux.conf .tmux.conf
echo "Installed tmuxconf!"

if [[ `brew list` =~ 'tmux' ]]
then
  echo "Skipping... tmux already installed"
else
  brew install tmux
fi
