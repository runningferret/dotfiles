#!/bin/sh

if [[ `brew list` =~ 'ack' ]]
then
  echo "Skipping... ack already installed"
else
  brew install ack
fi

if [[ `brew list` =~ 'wget' ]]
then
  echo "Skipping... wget already installed"
else
  brew install wget
fi

gem install ripper-tags --no-rdoc --no-ri
