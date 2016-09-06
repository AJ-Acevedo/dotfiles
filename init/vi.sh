#!/usr/bin/env bash
#
# AJAlabs.com
#
# vi plugins updater script
# v0.1b
#

# Load the includes variables and functions
source includes.sh

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

exit 0
