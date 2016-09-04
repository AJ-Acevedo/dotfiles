#!/usr/bin/env bash
#
# AJAlabs.com
#
# RVM install and updater script
# v0.1b
#
# RVM - Ruby Version Manager
# https://rvm.io/
#

# Load the includes variables and functions
source includes.sh

# Set counter to Zero
count=0

# Exit unless host OS is Mac OS X
# TODO: This should become a function in includes.sh
if [ `uname -s` != "Darwin" ]; then
  echo -e "\nThis script will only run on Mac OS X"
  echo "exiting"
  exit 1
fi

# Install RVM unless it already exists
if ! rvm -v > /dev/null 2>&1; then
  echo -e "\n  Installing RVM...\n"
  #TODO: insert RVM installer here
  count=1
fi

# Install gems if RVM was just installed
#if [ $count -eq 1 ]; then
#  #TODO: insert list of global gems
#fi

# If RVM already exists, check for updates
if [ $count -eq 0 ]; then
  echo -e "$txt_green""\n RVM is already installed""$txt_reset"
  echo -e "$txt_blue""\n Checking for RVM updates"
  echo -e " Please wait while we're prospecting...\n""$txt_reset"
  #rvm get stable
fi

exit 0
