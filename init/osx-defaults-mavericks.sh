#!/usr/bin/env bash
#
# AJAlabs.com
#
# OS X Default - Mavericks 10.9
# v0.4
#
# This is a customized version of ~/.osx — http://mths.be/osx
# Checkout http://secrets.blacktree.com for a extensive list of defaults
# Only defaults that have been tested to work with OS X 10.9 are enabled


# Exit unless host OS is Mac OS X
if [ `uname -s` != "Darwin" ]; then
  echo -e "\nThis script will only run on Mac OS X"
  echo "exiting"
  exit 1
fi

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx-defaults` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "DragonFly"
sudo scutil --set HostName "dragonfly"
sudo scutil --set LocalHostName "dragonfly"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "dragonfly"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400

# Menu bar: disable transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

###############################################################################
# Screen                                                                      #
###############################################################################

# Save screenshots to the screenshots folder
defaults write com.apple.screencapture location -string "$HOME/screenshots"

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
chflags nohidden ~/Library

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true


###############################################################################
# Terminal                                                                    #
###############################################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Use a modified version of the Pro theme by default in Terminal.app
open "$HOME/.dotfiles/init/AJAlabs.terminal"
sleep 2 # Wait a bit to make sure the theme is loaded
defaults write com.apple.terminal "Default Window Settings" -string "AJAlabs"
defaults write com.apple.terminal "Startup Window Settings" -string "AJAlabs"


###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true


###############################################################################
# TextMate 2.0                                                                #
###############################################################################

# Enable Font Smoothing always on
defaults write com.macromates.TextMate.preview fontSmoothing 1

# Set font size to 13
#defaults write com.macromates.textmate OakTextViewNormalFontSize -int 13

# Set font to Monaco
#defaults write com.macromates.textmate OakTextViewNormalFontName -string "Monaco"

echo ""
echo "Oh dip! it worked! Restart/Log Out to apply the changes."
echo ""
