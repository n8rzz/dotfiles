#!/usr/bin/env bash

################################
### Brewfile start
#
# @author Nate Geslin
#
# Inspired by:
# - https://github.com/mattstauffer/dotfiles/blob/master/.brew
# - https://github.com/AlexandreBroudin/dotfiles/blob/master/Brewfile
################################
# Make sure we’re using the latest Homebrew
brew 'update'

# Upgrade any already-installed formulae
brew 'upgrade'

# Install GNU core utilities (those that come with OS X are outdated)
brew 'coreutils'
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew 'findutils'

# Install Bash 4
brew 'bash'

tap 'homebrew/dupes'
brew 'homebrew/dupes/grep'

brew 'bash-completion'
brew 'git'
brew 'git-flow'
brew 'heroku-toolbelt'
brew 'postgresql', restart_service: true

## Setup Sask
#
# - https://github.com/caskroom/homebrew-cask
# brew tap caskroom/cask
brew 'caskroom/cask/brew-cask'
tap 'caskroom/versions'

cask 'atom'
cask 'blender'
cask 'dropbox'
cask 'google-chrome'
cask 'iterm2'
cask 'macvim'
cask 'pgadmin3'
cask 'postman'
cask 'slack'
cask 'spectacle'
cask 'sourcetree'
cask 'unity'
cask 'vagrant'
cask 'virtualbox'
cask 'virtualbox-extension-pack'

# Remove outdated versions from the cellar
brew cleanup
