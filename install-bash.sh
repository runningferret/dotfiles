#!/bin/bash
BASH_PROFILE_COMMON='source ~/.bash_profile_common'
cd ~

if [ -e .bash_profile_common ]
then
  mv .bash_profile_common .bash_profile_common.backup
  echo "Moved existing .bash_profile_common to .bash_profile_common.backup"
fi

ln -s dotfiles/bash_profile_common .bash_profile_common 
if grep -q "$BASH_PROFILE_COMMON" ~/.bash_profile
then
  echo "Skipping... bash common stuff already exists in .bash_profile"
else
  echo $BASH_PROFILE_COMMON >> ~/.bash_profile
  echo "Installed bash common stuff"
fi
