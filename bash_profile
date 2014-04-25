#!/usr/bin/env bash
# .bash_profile

if [ -f ~/.bashrc ]; then
     source ~/.bashrc
fi

# Load RVM into a shell session *as a function* if it exists
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
