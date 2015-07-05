#!/usr/bin/env bash
#
# AJAlabs.com
#
# Homebrew install and updater script
# v0.2
#
# Homebrew
# http://brew.sh/
#

# Set counter to Zero
count=0

# Exit unless host OS is Mac OS X
if [ `uname -s` != "Darwin" ]; then
  echo -e "\nThis script will only run on Mac OS X"
  echo "exiting"
  exit 1
fi

# Install Homebrew unless it already exists
if ! brew -v > /dev/null 2>&1; then
  echo -e "\n  Installing Homebrew...\n"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  count=1
fi

# Install packages if Homewbrew was just installed
if [ $count -eq 1 ]; then
  brew install git-lfs node python readline sqlite tree wget
fi

# If Homebrew already exists, update brew and all packages
if [ $count -eq 0 ]; then
  echo -e "\n Checking for Homebrew updates"
  echo -e " Please wait while things are brewing..."
  brew update && brew upgrade
fi

exit 0
