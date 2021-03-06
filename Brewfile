#!/usr/bin/env bash
#  -------------------------------------------------------------------------
#  Filename: Brewfile
#  Maintainer: Nate Geslin <teamtomkins23@gmail.com>
#  URL: http://github.com/n8rzz/dotfiles
#
#  Description:  Brewfile for installing system upgrades and
#                additional applications
#
#  Inspired by:
#  - https://github.com/mattstauffer/dotfiles/blob/master/.brew
#  - https://github.com/AlexandreBroudin/dotfiles/blob/master/Brewfile
#  -------------------------------------------------------------------------
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
brew 'heroku-toolbelt'
brew 'hub'
brew 'postgresql', restart_service: true
brew 'ren'
brew 'shellcheck'
brew 'tmux'

## Install Cask
# see - https://github.com/caskroom/homebrew-cask
# brew 'caskroom/cask/brew-cask'
tap 'caskroom/cask'
tap 'caskroom/versions'

# cask 'blender'
cask 'docker'
cask 'dropbox'
cask 'flux'
cask 'google-chrome'
cask 'heroku'
cask 'pgadmin3'
cask 'postman'
cask 'slack'
# cask 'spectacle'
# cask 'unity'
cask 'vagrant'
cask 'virtualbox'
cask 'virtualbox-extension-pack'
cask 'visual-studio-code'

# Remove outdated versions from the cellar
brew cleanup
