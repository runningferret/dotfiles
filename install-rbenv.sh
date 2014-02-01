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

if rbenv versions | grep -q "$RBENV_VERSION"
then
  echo "Skipping... $RBENV_VERSION already installed!"
else
  echo "******************************************"
  echo "Running: $RBENV_VERSION... This is gonna take a while, be patient"
  echo "******************************************"
  `rbenv install $RBENV_VERSION`
fi
