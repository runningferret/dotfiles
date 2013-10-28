#!/bin/sh

if [[ `brew list` =~ 'ack' ]]
then
  echo "Skipping... ack already installed"
else
  brew install ack
fi
