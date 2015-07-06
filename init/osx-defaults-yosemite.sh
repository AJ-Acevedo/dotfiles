#!/usr/bin/env bash
#
# AJAlabs.com
#
# OS X Defaults - Yosemite 10.10
# v0.1b
#
# This is a customized version of ~/.osx — http://mths.be/osx
# Checkout http://secrets.blacktree.com for a extensive list of defaults
# Only defaults that have been tested to work with OS X 10.9 are enabled


# Exit unless host OS is Mac OS X
if [ `uname -s` != "Darwin" ]; then
  echo -e "\n This script will only run on Mac OS X\n Exiting\n"
  exit 1
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx-defaults` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#TODO: Finally upgrading to Yosemite. Placeholder for defaults.



echo "\n Oh dip! it worked! Restart/Log Out to apply the changes.\n"
exit 0
