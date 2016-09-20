#!/usr/bin/env bash
#
# AJAlabs.com
#
# Xcode Command Line Tools - Initialization
# v0.1
#

# Load the includes variables and functions
source includes.sh

# Exit unless host OS is macOS
if [ `uname -s` != "Darwin" ]; then
  echo -e "\nThis script will only run on macOS"
  echo "exiting"
  exit 1
fi

# Check if Xcode Command Line Tools exists

if ! xcode-select -p > /dev/null 2>&1; then
  echo -e "$txt_yellow""\n XCode Command Line Tools are not installed""$txt_reset"
  echo -e " A dialog box will pop-up to install the tools now\n"

  # Open the GUI XCode Install dialog box
  xcode-select --install

  # Check if XCode Command Line Tools were installed
  echo -e "$txt_yellow""\n Have the XCode Command Line Tools been installed? ['y' or 'n']""$txt_reset"
  # Read the user's standar input
  read installed_xcode_tools

  # Exit if CLI Tools were not installed
  if [ $installed_xcode_tools != "y" ]; then
    echo -e "$txt_red""\n Install Xcode Command Line Tools and rerun tiddlywindks!\n""$txt_reset"
    exit 1
  fi

else
  echo -e "$txt_green""\n Xcode Command Line Tools are already installed""$txt_reset"
  exit 0
fi
