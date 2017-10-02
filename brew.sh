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
brew upgrade --all

# Bash 4
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"

if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  # Prompts for password
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  # Change to the new shell, prompts for password
  chsh -s /usr/local/bin/bash;
fi;

brew install wget --with-iri
brew install go
brew install git
brew install tree
brew install python
brew install python3
brew install ruby-build
brew install rbenv
brew install bazel
brew install swig
brew install coreutils
brew install shellcheck

# Install Heroku
brew install heroku-toolbelt
heroku update

# Install Octave
brew tap homebrew/science
brew install octave

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew tap caskroom/fonts 

# Core casks
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" xquartz

# Development tool casks
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" visual-studio-code

# Misc casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" google-japanese-ime
brew cask install --appdir="/Applications" google-play-music-desktop-player
brew cask install --appdir="/Applications" tunnelbear
brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" adobe-photoshop-cc
brew cask install --appdir="/Applications" music-manager
brew cask install --appdir="/Applications" minimalclock
brew cask install --appdir="/Applications" libreoffice
brew cask install --appdir="/Applications" google-backup-and-sync

# Fonts casks
brew cask install --appdir="/Applications" font-ricty-diminished

# JUMAN++
brew tap chezou/homebrew-jumanpp
brew install jumanpp

# Remove outdated versions from the cellar.
brew cleanup
