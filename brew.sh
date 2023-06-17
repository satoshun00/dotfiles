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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Bash 4
brew install bash
brew install bash-completion@2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"

if ! grep -F -q '/opt/homebrew/bin/bash' /etc/shells; then
  # Prompts for password
  echo '/opt/homebrew/bin/bash' | sudo tee -a /etc/shells;
  # Change to the new shell, prompts for password
  chsh -s /opt/homebrew/bin/bash;
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
brew install jq
brew install java
brew install mysql-client
brew install awscli

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

# Core casks
brew install --cask xquartz

# Development tool casks
brew install --cask virtualbox
brew install --cask docker
brew install --cask dotnet
brew install --cask visual-studio
brew install --cask visual-studio-code

# Misc casks
brew install --cask google-chrome
brew install --cask firefox
brew install --cask slack
brew install --cask google-japanese-ime
brew install --cask adobe-creative-cloud
brew install --cask chatwork
brew install --cask google-drive
brew install --cask charles
brew install --cask google-cloud-sdk
brew install --cask unity-hub

# Fonts casks
brew install --cask font-ricty-diminished

# Remove outdated versions from the cellar.
brew cleanup
