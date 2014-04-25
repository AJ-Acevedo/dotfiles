#!/usr/bin/env bash
# .bashrc


#-------------------------------------------------------------
# Ignore bashrc for non-interactive shells
#-------------------------------------------------------------

if [[ $- != *i* ]]; then 
  return; 
fi


#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------

if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi


#-------------------------------------------------------------
# aliases
#-------------------------------------------------------------
alias ..1='cd ../'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'

alias gd='git diff'
alias gm='git merge --no-ff'
alias gs='git status'
alias ls='ls -alh'
alias mb='mv'
alias .s='source ~/.bashrc'
alias tocuh='touch'

alias sshaja="ssh -R 52698:localhost:52698 ajalabs.com"
alias socksaja="ssh -D 1717 ajalabs.com"


#-------------------------------------------------------------
# History
#-------------------------------------------------------------
#Erase Duplicates
export HISTCONTROL=erasedups
#Set History Size
export HISTSIZE=50000
export HISTCONTROL=ignorespace

#Append to bash_history and do not overwrite
shopt -s histappend


#-------------------------------------------------------------
# CLI COLOR
#-------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad


#-------------------------------------------------------------
# PS1 PROMPT 'user@hostname cwd (git_branch • )$ '
#-------------------------------------------------------------

# Add Git repo/branch and status to the PS1 PROMPT
source ~/.dotfiles/config/git-prompt.sh

# echo -n -e "\033]0;`basename $PWD`\007" Adds the cwd to the shell window and tab
PROMPT_COMMAND='__git_ps1 "\u@\h \W" "\\\$ ";echo -n -e "\033]0;`basename $PWD`\007"'
echo -n -e "\033]0;`basename $PWD`\007"

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true


#-------------------------------------------------------------
# TAB Auto-Completion
#-------------------------------------------------------------

# Grunt JS -  requires grunt to be installed globally with
# npm install -g grunt
[[ -r "$HOME/.npm/grunt" ]] && eval "$(grunt --completion=bash)"

# RVM - Requires RVM to be installed
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# Git
source ~/.dotfiles/config/git-completion.sh


#-------------------------------------------------------------
# PATHS
#-------------------------------------------------------------

# Prepend Homebrew's PATH before $PATH
export PATH="/usr/local/bin:$PATH"

# Add ~/bin
export PATH=$PATH:$HOME/bin

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin


#-------------------------------------------------------------
# Environments
#-------------------------------------------------------------
export NODE_ENV=development


##############################################################
# BEGIN - Mac OS X Specific configurations
##############################################################
if [ `uname -s` == "Darwin" ]; then

#-------------------------------------------------------------
# Set default Editor to TextMate
#-------------------------------------------------------------
export EDITOR="$HOME/bin/mate -w"
export GIT_EDITOR="$HOME/bin/mate -w"
export VISUAL="$HOME/bin/mate -w"

fi
##############################################################
# END - Mac OS X Specific configurations
##############################################################


##############################################################
# BEGIN - Linux Specific configurations
##############################################################
if [ `uname -s` == "Linux" ]; then

#-------------------------------------------------------------
# Set default Editor to vi
#-------------------------------------------------------------
export EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim

fi
##############################################################
# END - Linux Specific configurations
##############################################################
