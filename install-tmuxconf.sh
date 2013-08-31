#!/bin/sh

cd ~
if [ -e .tmux.conf ]
then
  mv .tmux.conf .tmux.conf.backup
  echo "Moved existing .tmux.conf to .tmux.conf.backup"
fi

ln -s dotfiles/tmux.conf .tmux.conf
echo "Installed tmuxconf!"
