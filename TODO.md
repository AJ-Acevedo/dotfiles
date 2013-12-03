- Setup Rakefile to install on both Mac OS X and Linux
  - gitconfig 
     [credential]
 	     helper = osxkeychain
  - Setup OS specific rc files
- Create private bash rc and add to .gitignore

- For Linux
export EDITOR="vim"

- Implement a backup option for existing files
https://github.com/itsthomson/dotfiles/blob/master/Rakefile

- Verify all .osx defaults are compatible with 10.9


- Add bash completion
https://github.com/mathiasbynens/dotfiles/pull/278

- Add git completion

- Customize bash prompt
I want git in the prompt and the $ on a new line
ie: https://github.com/necolas/dotfiles#custom-bash-prompt