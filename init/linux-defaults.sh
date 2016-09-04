#!/usr/bin/env bash
#
# AJAlabs.com - AJ Acevedo
#
# Linux Defaults
# v0.0
#
# Debian Linux default configuration script placeholder


# Exit unless host OS is Linux
if [ `uname -s` != "linux" ]; then
  echo -e "\nThis script will only run on Linux"
  echo "exiting"
  exit 1
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `linux-defaults.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


