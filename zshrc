ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ajalabs"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"

plugins=(git bundler brew gem ajalabs)

export PATH="/usr/local/bin:$PATH"
export EDITOR='mate -w' # Set TextMate 2 as the default editor

source $ZSH/oh-my-zsh.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/bin # Add ~/bin
