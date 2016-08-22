#!/usr/bin/env bash

# TODO: this file is a work in progress and is currently non-functional
# This file is a collection of scripts that take a new laptop from factory clean to developer awesome

# Install rvm and ruby
rvm / ruby / bundler
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby

# setup brew if it doesnt exist
if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

brew tap homebrew/bundle
brew bundle

# dotfiles
git clone https://github.com/n8rzz/dotfiles.git ~/

# Setup local dev folders
mkdir ~/Documents/www
mkdir ~/Documents/unity

# Add support repositories
git clone https://github.com/n8rzz/rails-templates.git ~/Documents/www/_rails-template-files
git clone https://github.com/n8rzz/ss-orca-syntax.git ~/Documents/www
git clone https://github.com/n8rzz/ss-orca-ui.git ~/Documents/www
apm link ~/Documents/www/ss-orca-syntax
apm link ~/Documents/www/ss-orca-ui

# Install ruby gems
gem install bundler rails
