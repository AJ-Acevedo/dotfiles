#!/usr/bin/env bash

# AJAlabs.com
#
# Initializer - One script to rule them all!!!
# v0.1b
#
# TODO: This file should verify the OS type then source the OS specific defaults configuration scripts.
# The initializer should eventually replace the Rakefile
#

# Load the includes variables and functions
source includes.sh

# Let's get started
echo -e "$txt_blue""\n They see me rollin...""$txt_reset"
sleep 1
echo -e "$txt_blue""\n They hatin...\n"
sleep .5
echo "."
sleep .5
echo "."
sleep .5
echo -e ".""$txt_reset"
echo -e "$txt_green""\n Let's roll!""$txt_reset"
sleep 1
clear
echo -e "$txt_blue""AJAlabs""$txt_reset"

# Run Xcode script
./xcode-tools.sh

# Rakefile
# TODO: Start the Rakefile config here

# Homebrew
./brew.sh

# RVM
./rvm.sh

# Vi
./vi.sh

if (($? > 0)); then
  echo -e "$txt_red""\n FAIL! There was a problem with one of the scripts...""$txt_reset"
    exit 1
  else
    echo -e "$txt_green""\n Success! All scripts have completed with no errors\n""$txt_reset"
      exit 0
fi
