# AJ's dotfiles

These dotfiles are a set of configuration files for Mac OS X and Linux, that make my life in front of the keyboard just a little bit easier.

dotfiles are like a developer's toolbox.

I'm using [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) and a fork of  [ryanb/dotfiles](https://github.com/ryanb/dotfiles)

For more information on dotfiles, checkout [dotfiles.github.io](http://dotfiles.github.io/)


## Installation

Run the following commands in your terminal. It will prompt you before it does anything destructive. Check out the [Rakefile](https://github.com/aj-acevedo/dotfiles/blob/custom-bash-zsh/Rakefile) to see exactly what it does.

```terminal
git clone git://github.com/aj-acevedo/dotfiles ~/.dotfiles
cd ~/.dotfiles
rake install
```

After installing, open a new terminal window to see the changes take effect.


## Features

TODO: ...


## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```
unlink ~/.gitignore
unlink ~/.gemrc
unlink ~/.irbrc
unlink ~/.railsrc
unlink ~/.vim
unlink ~/.vimrc
rm ~/.zshrc # careful here
rm ~/.gitconfig
rm -rf ~/.dotfiles
rm -rf ~/.oh-my-zsh
chsh -s /bin/bash # change back to Bash if you want
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
