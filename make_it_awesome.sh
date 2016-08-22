# TODO: this file is a work in progress and is currently non-functional
# This file is a collection of scripts that take a new laptop from factory clean to developer awesome

# setup brew if it doesnt exist

brew tap homebrew/bundle
brew bundle

# TODO: move to Brewfile
# TODO: setup brew and cask installs in a Brewfile - https://github.com/Homebrew/homebrew-bundle
################################
### Brewfile start

# @author Nate Geslin
#
# Inspired by - https://github.com/mattstauffer/dotfiles/blob/master/.brew
################################
# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install findutils

# Install Bash 4
install bash

tap homebrew/dupes
install homebrew/dupes/grep

install bash-completion
install git
install git-flow
install heroku-toolbelt
install postgresql

## setup cask
# https://github.com/caskroom/homebrew-cask
# brew tap caskroom/cask
install caskroom/cask/brew-cask

cask install atom
cask install blender
cask install dropbox
cask install google-chrome
cask install iterm2
cask install macvim
cask install pgadmin3
cask install postman
cask install slack
cask install sourcetree
cask install unity
cask install vagrant
cask install virtualbox
cask install virtualbox-extension-pack

# Remove outdated versions from the cellar
brew cleanup

### / Brewfile
################################

# dotfiles
git clone https://github.com/n8rzz/dotfiles.git ~/

# local folder setup
mkdir ~/Documents/www
mkdir ~/Documents/unity

# support folders
# git clone _rails-template-files ~/Documents/www/_rails-template-files
git clone https://github.com/n8rzz/ss-orca-syntax.git ~/Documents/www
git clone https://github.com/n8rzz/ss-orca-ui.git ~/Documents/www
apm link ~/Documents/www/ss-orca-syntax
apm link ~/Documents/www/ss-orca-ui


# rvm / ruby
rvm / ruby / bundler
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# ruby gems
gem install bundler rails
