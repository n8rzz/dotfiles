#!/usr/bin/env bash
#  -------------------------------------------------------------------------
#  Filename: make_it_awesome.sh
#  Maintainer: Nate Geslin <teamtomkins23@gmail.com>
#  URL: http://github.com/n8rzz/dotfiles
#
#  Description:  From fresh Mac to Awesome Mac! Upgrade or install system pkgs
#                then setup system with baseline applications and folders.
#
#                This script should only be run once for initial setup. For
#                maintaining current dotfiles or support, see `install.sh`.
#  -------------------------------------------------------------------------

# setup brew if it doesnt exist
if ! command -v brew >/dev/null; then
  echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

# Brew and Cask install
brew tap homebrew/bundle
brew bundle

# Install rvm and ruby
# rvm / ruby / bundler
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby

# Install ruby gemsV
gem install bundler rails travis istats

# Setup local dev folders
mkdir ~/Documents/www
# mkdir ~/Documents/unity

# Add support repositories
# git clone https://github.com/n8rzz/rails-templates.git ~/Documents/www/_rails-template-files
git clone https://github.com/n8rzz/ss-orca-syntax.git ~/Documents/www
git clone https://github.com/n8rzz/ss-orca-ui.git ~/Documents/www
apm link ~/Documents/www/ss-orca-syntax
apm link ~/Documents/www/ss-orca-ui

# Install n and node + npm
# mkdir -p "$N_PREFIX/bin"
# curl -o "$N_PREFIX/bin/n https://raw.githubusercontent.com/visionmedia/n/master/bin/n"
# chmod +x "$N_PREFIX/bin/n"
# n stable
curl -L https://git.io/n-install | bash

# npm pacakges
npm install -g gulp-cli http-server
