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
brew 'update'
brew 'upgrade'

brew 'coreutils'
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew 'findutils'
brew 'bash'

tap 'homebrew/dupes'
brew 'homebrew/dupes/grep'

brew 'bash-completion'
brew 'git'
brew 'git-flow'
brew 'heroku-toolbelt'
brew 'postgresql', restart_service: true

## Setup Cask
#
# - https://github.com/caskroom/homebrew-cask
# brew 'caskroom/cask/brew-cask'
tap 'caskroom/cask'
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
