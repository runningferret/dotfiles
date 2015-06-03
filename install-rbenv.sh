#!/bin/sh
RBENV_EVAL='eval "$(rbenv init -)"'
RBENV_VERSION='1.9.3-p448'

if [[ `brew list` =~ 'rbenv' ]]
then
  echo "Skipping... rbenv already installed"
else
  brew install rbenv
fi

if [[ `brew list` =~ 'ruby-build' ]]
then
  echo "Skipping... ruby-build already installed"
else
  brew install ruby-build
fi

