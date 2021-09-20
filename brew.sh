#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Bash 4
brew install bash
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"

if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  # Prompts for password
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  # Change to the new shell, prompts for password
  chsh -s /usr/local/bin/bash;
fi;

brew install wget
brew install go
brew install git
brew install git-lfs
brew install tree
brew install python
brew install ruby-build
brew install rbenv
brew install coreutils
brew install shellcheck
brew install mkcert
brew install nkf
brew install redis
brew install jq

# Install Heroku
brew install heroku/brew/heroku
heroku update

# Install Octave
brew tap brewsci/bio
brew install octave

# Install Cask
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

# Core casks
brew install --cask --appdir="~/Applications" java
brew install --cask --appdir="~/Applications" xquartz

# Development tool casks
brew install --cask --appdir="/Applications" sublime-text
brew install --cask --appdir="/Applications" virtualbox
brew install --cask --appdir="/Applications" docker
brew install --cask --appdir="/Applications" visual-studio-code

# Misc casks
brew install --cask --appdir="/Applications" google-chrome
brew install --cask --appdir="/Applications" firefox
brew install --cask --appdir="/Applications" skype
brew install --cask --appdir="/Applications" slack
brew install --cask --appdir="/Applications" dropbox
brew install --cask --appdir="/Applications" evernote
brew install --cask --appdir="/Applications" spotify
brew install --cask --appdir="/Applications" google-japanese-ime
brew install --cask --appdir="/Applications" tunnelbear
brew install --cask --appdir="/Applications" adobe-creative-cloud
brew install --cask --appdir="/Applications" chatwork
brew install --cask --appdir="/Applications" libreoffice
brew install --cask --appdir="/Applications" google-backup-and-sync
brew install --cask --appdir="/Applications" charles
brew install --cask --appdir="/Applications" google-cloud-sdk
brew install --cask --appdir="/Applications" unity-hub

# Fonts casks
brew install --cask --appdir="/Applications" font-ricty-diminished

# JUMAN++
brew tap chezou/homebrew-jumanpp
brew install jumanpp

# Remove outdated versions from the cellar.
brew cleanup
