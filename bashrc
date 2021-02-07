#!/usr/bin/env bash
# .bashrc

# Author: AJ Acevedo
# Author URI: http://AJAlabs.com
# License: MIT

#-------------------------------------------------------------
# Ignore bashrc for non-interactive shells
#-------------------------------------------------------------

if [[ $- != *i* ]]; then
  return;
fi


#-------------------------------------------------------------
# Source global definitions (if any exist)
#-------------------------------------------------------------

# For macOS
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# For Debian Linux
if [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc
fi


#-------------------------------------------------------------
# Source private bash definitions (if any exist)
#-------------------------------------------------------------

if [ -f ~/.bash_private ]; then
  source ~/.bash_private
fi


#-------------------------------------------------------------
# aliases - Global
#-------------------------------------------------------------
alias ..1='cd ../'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'

alias gd='git diff'
alias gm='git merge --no-ff'
alias gs='git status'
alias mb='mv'
alias .s='source ~/.bashrc'
alias tocuh='touch'
alias showip='ifconfig | grep "inet" | grep -v 127.0.0.1'
alias fixRSA='ssh-keygen -f ~/.ssh/known_hosts -R'
alias sshit="ssh -oHostKeyAlgorithms=ssh-rsa -o KexAlgorithms=diffie-hellman-group1-sha1 -o Ciphers=aes256-cbc,3des-cbc"


#-------------------------------------------------------------
# History
#-------------------------------------------------------------
# Set History Size to 50,000 line! Yeah buddy!
export HISTSIZE=50000

# Append to bash_history and do not overwrite
shopt -s histappend

# Ignore duplicates, erase duplicates and ignore lines that start with a space
export HISTCONTROL=ignoreboth:erasedups

#-------------------------------------------------------------
# PS1 PROMPT 'user@hostname cwd (git_branch • )$ '
#-------------------------------------------------------------


if [ -f ~/.dotfiles/config/git-prompt.sh ]; then
  # Add Git repo/branch and status to the PS1 PROMPT
  source ~/.dotfiles/config/git-prompt.sh

  # echo -n -e "\033]0;`basename $PWD`\007" Adds the cwd to the shell window and tab
  PROMPT_COMMAND='__git_ps1 "\u@\h \W" "\\\$ ";echo -n -e "\033]0;`basename $PWD`\007"'
  echo -n -e "\033]0;`basename $PWD`\007"

  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true
fi

#-------------------------------------------------------------
# MISC
#-------------------------------------------------------------
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#-------------------------------------------------------------
# PATHS
#-------------------------------------------------------------

# Prepend Homebrew's PATH before $PATH
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Add ~/bin
export PATH=$PATH:$HOME/bin

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Clean up duplicates in $PATH and remove trailing :
PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '!($0 in a) {a[$0]; print}' | sed "s/\(.*\).\{1\}/\1/")


#-------------------------------------------------------------
# TAB Auto-Completion
#-------------------------------------------------------------

# Grunt JS -  requires grunt to be installed globally with
# npm install -g grunt
[[ -r "$HOME/.npm/grunt" ]] && eval "$(grunt --completion=bash)"

# RVM - Requires RVM to be installed
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# Git
if [ -f ~/.dotfiles/config/git-completion.sh ]; then
  source ~/.dotfiles/config/git-completion.sh
fi

#-------------------------------------------------------------
# Environments
#-------------------------------------------------------------
export NODE_ENV=development


#-------------------------------------------------------------
# RVM - Ruby Version Manager
#-------------------------------------------------------------

# Load RVM into a shell session *as a function* if it exists
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


#-------------------------------------------------------------
# Python
#-------------------------------------------------------------

# Prevent those pesky .pyc and __pycache__ files/folder from being created.
export PYTHONDONTWRITEBYTECODE=1

# Also setup some python aliases
#TODO: Fix conditional to not use which

#if which python3 >/dev/null; then
#  export PYTHONDONTWRITEBYTECODE=1
#  alias python='python3'
#  alias pip='pip3'
#else
#  echo "Python is not installed"
#fi

# Required for pyenv - https://github.com/pyenv/pyenv
eval "$(pyenv init -)"
export PYENV_VERSION=3.9.1

##############################################################
# BEGIN - macOS Specific configurations
##############################################################
if [ `uname -s` == "Darwin" ]; then

# Silence the bash deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1

#-------------------------------------------------------------
# macOS specific aliases
#-------------------------------------------------------------
#alias ls='ls -f1 -lh' THIS IS BROKEN in macOS 10.13
alias ls='ls -alh'


#-------------------------------------------------------------
# Set default Editor to TextMate
#-------------------------------------------------------------
export EDITOR="$HOME/bin/mate -w"
export GIT_EDITOR="$HOME/bin/mate -w"
export VISUAL="$HOME/bin/mate -w"

#-------------------------------------------------------------
# CLI COLOR
#-------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=gxcxfxdxbxegedabagDxad

fi

#-------------------------------------------------------------
# Set UTF 8 Locales
#-------------------------------------------------------------
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

##############################################################
# END - macOS Specific configurations
##############################################################


##############################################################
# BEGIN - Linux Specific configurations
##############################################################
if [ `uname -s` == "Linux" ]; then

#-------------------------------------------------------------
# Linux specific aliases
#-------------------------------------------------------------
alias ls='ls -alh --color'

#-------------------------------------------------------------
# Set default Editor to vi
#-------------------------------------------------------------
export EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim


#-------------------------------------------------------------
# CLI COLOR
#-------------------------------------------------------------
export CLICOLOR=1
export LS_COLORS='di=36:ln=32:so=35:pi=33:ex=31:or=31;5'


#-------------------------------------------------------------
# NodeJS JavaScript runtime
#-------------------------------------------------------------
#TODO: Fix conditional to not use which
if which node >/dev/null; then
  export EXECJS_RUNTIME=node
else
  echo "Node is not installed"
fi


fi
##############################################################
# END - Linux Specific configurations
##############################################################
