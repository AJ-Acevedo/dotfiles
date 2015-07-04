#!/usr/bin/env bash
#
# Homebrew
# http://brew.sh/
#
# This installs Homebrew and some common dependencies using.

# Check if Homebrew is installed
if test ! $(which brew)
then
  echo "  Installing Homebrew."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install homebrew packages
brew install node sqlite tree wget 

exit 0