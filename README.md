# AJ's dotfiles

These dotfiles are a set of configuration files for macOS and Linux, that make my life in front of the keyboard just a little bit easier.

dotfiles are like a programmer's toolbox.

I am using macOS 15.x and my preferred Linux distributions are Debian and Ubuntu.


For more information on dotfiles, checkout [dotfiles.github.io](http://dotfiles.github.io/)


## Installation

Run the following commands in your terminal. It will prompt you before it does anything destructive. Check out the [Rakefile](https://github.com/AJ-Acevedo/dotfiles/blob/master/Rakefile) to see exactly what it does.

```terminal
git clone git@github.com:AJ-Acevedo/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake install
```

After the installation completes, open a new terminal window to see the changes take effect.

NOTE: There are additional installer scripts in the `~/.dotfiles/init` directory that can be run as well.


## Updating and adding VIM plugins

To update the VIM plug-ins, run the following commands from the .dotfiles root directory

```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

`git submodule foreach git pull origin master`

When adding new VIM plug-ins, be sure to add them as git submodules

`git submodule add git@github.com:scrooloose/nerdtree.git`


## Features

- Tab auto-completion for Git and Grunt JS
- Custom list of git config aliases and configurations
- Add a Git repo's branch name to the PS1 prompt with red, yellow, and green status indicators:
'user@hostname cwd (git_branch • )$ '
- Matching TextMate and vim themes
- vim customization


## Note

All of the .dotfiles are symbolically linked from .dotfiles to the home directory via the Rakefile.
Any of these files can also be manually linked using `ln -s ~/.dotfiles/ansible.cfg ~/.ansible.cfg`

## Uninstall

To remove the dotfile configs, run the following commands.  
Be certain to double check the contents of the files before removing them so you don't lose your custom settings.

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

## License

[Copyright (C) 2013 - 2025 AJ Acevedo](https://github.com/AJ-Acevedo/dotfiles/blob/master/LICENSE.md)

## Author

**AJ Acevedo**

- [twitter @aj_acevedo](https://twitter.com/aj_acevedo)
- [GitHub @AJ-Acevedo](https://github.com/AJ-Acevedo)
- [LinkedIn - AJ Acevedo](http://www.linkedin.com/in/acevedoaj)
- [AJAcevedo.com](https://AJAcevedo.com)
- [AJAlabs.com](https://AJAlabs.com)