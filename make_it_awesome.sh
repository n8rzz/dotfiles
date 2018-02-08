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

install_homebrew () {
  # setup brew if it doesnt exist
  if ! command -v brew >/dev/null; then
    echo "Installing Homebrew ..."
      curl -fsS \
        'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
  fi
}

install_bundles () {
  # Brew and Cask install
  brew tap homebrew/bundle
  brew bundle
}

install_rvm () {
  # Install rvm and ruby
  # rvm / ruby / bundler
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  curl -sSL https://get.rvm.io | bash -s stable --ruby
}

install_gems () {
  # Install ruby gems
  gem install bundler rails travis istats
}

create_www_dir () {
  # Setup local dev folders
  mkdir -p ~/Documents/www
}

install_node () {
  # Install nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
}

install_global_node_modules () {
  # npm pacakges
  npm install -g gulp-cli http-server typescript
}

install_homebrew
install_bundles

install_rvm
install_gems
create_www_dir
install_node
install_global_node_modules
