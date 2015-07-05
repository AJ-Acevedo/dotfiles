#!/usr/bin/env bash
#
# AJAlabs.com
#
# RVM install and updater script
# v0.1
#
# RVM - Ruby Version Manager
# https://rvm.io/
#

# Set counter to Zero
count=0

# Exit unless host OS is Mac OS X
if [ `uname -s` != "Darwin" ]; then
  echo -e "\nThis script will only run on Mac OS X"
  echo "exiting"
  exit 1
fi

# Install RVM unless it already exists
if ! brew -v > /dev/null 2>&1; then
  echo -e "\n  Installing RVM...\n"
  #TODO: insert RVM installer here
  count=1
fi

# Install gems if RVM was just installed
if [ $count -eq 1 ]; then
  #TODO: insert list of global gems
fi

# Check for updates if RVM already exists
if [ $count -eq 0 ]; then
  #TODO: insert RMV updates
fi

exit 0
