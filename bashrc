#!/usr/bin/env bash
# .bashrc

#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi


#-------------------------------------------------------------
# aliases
#-------------------------------------------------------------
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'

alias gd='git diff'
alias gm='git merge --no-ff'
alias gs='git status'
alias ls='ls -alh'
alias mb='mv'

alias sshaja="ssh -R 52698:localhost:52698 ajalabs.com"
alias socksaja="ssh -D 1717 ajalabs.com"


#-------------------------------------------------------------
# History
#-------------------------------------------------------------
#Erase Duplicates
export HISTCONTROL=erasedups
#Set History Size
export HISTSIZE=50000
#Append to bash_history if Terminal.app quits
shopt -s histappend


#-------------------------------------------------------------
# CLI COLOR
#-------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad


#-------------------------------------------------------------
# TextMate
#-------------------------------------------------------------
export EDITOR="$HOME/bin/mate -w"


#-------------------------------------------------------------
# RVM
#-------------------------------------------------------------
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


#-------------------------------------------------------------
# PATHS
#-------------------------------------------------------------

# Prepend Homebrew's PATH before $PATH
export PATH="/usr/local/bin:$PATH"

# Add ~/bin
export PATH=$PATH:$HOME/bin
