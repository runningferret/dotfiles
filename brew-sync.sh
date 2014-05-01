#!/bin/bash
# Built from https://gist.github.com/jpawlowski/5248465
# Sync Homebrew installations between Macs via Dropbox

BREW="/usr/local/bin/brew"
CASK="$BREW cask"

# first get local settings
echo "Reading local settings..."
rm -f /tmp/brew-sync.*
$BREW tap > /tmp/brew-sync.taps
$BREW list > /tmp/brew-sync.installed

echo "Get casks too..."
$CASK list > /tmp/brew-cask-sync.installed

# then combine it with list in Dropbox
echo "Reading settings from Dropbox..."
[ -e ~/Dropbox/Apps/Homebrew/brew-sync.taps ] && cat ~/Dropbox/Apps/Homebrew/brew-sync.taps >> /tmp/brew-sync.taps
[ -e ~/Dropbox/Apps/Homebrew/brew-sync.installed ] && cat ~/Dropbox/Apps/Homebrew/brew-sync.installed >> /tmp/brew-sync.installed
[ -e ~/Dropbox/Apps/Homebrew/brew-cask-sync.installed ] && cat ~/Dropbox/Apps/Homebrew/brew-cask-sync.installed >> /tmp/brew-cask-sync.installed

# make the lists unique and sync into Dropbox
echo "Syncing to Dropbox..."
mkdir -p ~/Dropbox/Apps/Homebrew
cat /tmp/brew-sync.taps | sort | uniq > ~/Dropbox/Apps/Homebrew/brew-sync.taps
cat /tmp/brew-sync.installed | sort | uniq > ~/Dropbox/Apps/Homebrew/brew-sync.installed
cat /tmp/brew-cask-sync.installed | sort | uniq > ~/Dropbox/Apps/Homebrew/brew-cask-sync.installed

# Update brew
echo "Update brew, brew-cask"
brew update && brew upgrade brew-cask && brew cleanup

# Set taps
echo "Enabling taps..."
for TAP in `cat ~/Dropbox/Apps/Homebrew/brew-sync.taps`; do
  $BREW tap ${TAP} >/dev/null
done

# Install missing Homebrew packages
BREW_LIST=`brew list`

echo "Install missing brew packages..."
for PACKAGE in `cat ~/Dropbox/Apps/Homebrew/brew-sync.installed`; do
  echo "Checking ${PACKAGE}..."
  grep -q ${PACKAGE} <<< $BREW_LIST >/dev/null #Here string, who knew
  if [ "$?" != "0" ]; then 
    echo " INSTALLING" 
    $BREW install ${PACKAGE}
  else
    echo " NOPE"
  fi
done

# Install missing Homebrew Casks
CASK_LIST=`brew cask list`

echo "Install missing brew casks..."
for PACKAGE in `cat ~/Dropbox/Apps/Homebrew/brew-cask-sync.installed`; do
  echo "Checking ${PACKAGE}..."
  grep -q ${PACKAGE} <<< $CASK_LIST >/dev/null
  if [ "$?" != "0" ]; then
    echo " INSTALLING" 
    $CASK install ${PACKAGE}
  else
    echo " NOPE"
  fi
done
