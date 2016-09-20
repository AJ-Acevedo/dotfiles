#!/usr/bin/env bash
#
# AJAlabs.com
#
# Homebrew install and updater script
# v0.3
#
# Homebrew
# http://brew.sh/
#

# Load the includes variables and functions
source includes.sh

# Set counter to Zero
count=0

# Exit unless host OS is macOS
# TODO: This should become a function in includes.sh
if [ `uname -s` != "Darwin" ]; then
  echo -e "\nThis script will only run on macOS"
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
  brew install git-lfs node openssl python readline sqlite tree wget
fi

# If Homebrew already exists, update brew and all packages
if [ $count -eq 0 ]; then
  echo -e "$txt_blue""\n Checking for Homebrew updates"
  echo -e " Please wait while things are brewing...\n""$txt_reset"
  brew update && brew upgrade && brew cleanup
  #TODO: If the result is Already up-to-date, there should be a green output message indicating brew is up-to-date.
fi

exit 0
