# AJ's dotfiles

These dotfiles are a set of configuration files for Mac OS X and Linux, that make my life in front of the keyboard just a little bit easier.

dotfiles are like a developer's toolbox.

I am using Mac OS X 10.9 and my preferred Linux distribution is Debian.  
Currently running Debian 7.4 (wheezy)


For more information on dotfiles, checkout [dotfiles.github.io](http://dotfiles.github.io/)


## Installation

Run the following commands in your terminal. It will prompt you before it does anything destructive. Check out the [Rakefile](https://github.com/AJ-Acevedo/dotfiles/blob/master/Rakefile) to see exactly what it does.

```terminal
git clone git://github.com/aj-acevedo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake install
```

After the installation completes, open a new terminal window to see the changes take effect.


## Features

- Tab auto-completion for Git and Grunt JS
- Custom list of git config aliases and configurations
- Add a Git repo's branch name to the PS1 PROMT with red, yellow and green status indicators:
'user@hostname cwd (git_branch • )$ '
- Matching TextMate and vim themes
- vim customization

## Uninstall

To remove the dotfile configs, run the following commands.  
Be certain to double check the contents of the files before removing so you don't lose custom settings.

```
unlink ~/.bash_profile  
unlink ~/.bashrc  
unlink ~/.gemrc  
unlink ~/.gitignore  
unlink ~/.irbrc  
unlink ~/.railsrc  
unlink ~/.vim  
unlink ~/.vimrc  
rm ~/.gitconfig  
rm -rf ~/.dotfiles  
```

Then open a new terminal window to see the changes take effect.


Feel free to clone, modify, share, and use these dotfiles as your own.  
enjoy
[AJ](https://twitter.com/AJ_Acevedo)

## License

Copyright (C) 2013 AJ Acevedo

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Suite 500 Boston, MA 02110-1335, USA
