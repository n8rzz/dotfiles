#!/usr/bin/env bash
#  -------------------------------------------------------------------------
#  Filename: make_symlinks.sh
#  Maintainer: Nate Geslin <teamtomkins23@gmail.com>
#  URL: http://github.com/n8rzz/dotfiles
#
#  Description: bash aliases defined. This file will be sourced from either
#               the .bash_profile or .bashrc (when on linux).
#
#  -------------------------------------------------------------------------
alias ll='ls -la'
alias ~='cd ~'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

## Tmux
alias tls='tmux ls'
alias ta='tmux attach-session -t'

## Docker
alias dc='docker-compose'
alias de='docker exec -it'
alias dcd='docker-compose down'
alias dcb='docker-compose build'
alias dcu='docker-compose up'
alias docker-destory="sh ~/dotfiles/scripts/docker-destory.sh"

## Git
alias gst='clear && git status'
alias gco='git checkout'
alias gcm='checkmeout'
alias gbr='git branch'
alias ga='git add .'
alias gr='git reset HEAD --hard && git clean -f -d'
alias gdc='git diff --stat --color'
alias gl='git log --pretty=format:"%C(bold black)%h%Creset %C(magenta)[%cr]%Creset ~>%C(green)%d%Creset %s %C(yellow)<%an>%Creset" --abbrev-commit'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
# alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias gcount='git rev-list --count --no-merges'
alias gtag='git describe --abbrev=0 --tags'

# hub + git
alias gci='hub ci-status -v $(git rev-parse HEAD)'

## Node & NPM
alias ni='npm install --verbose'

## Rails
alias migrate='rake db:migrate && rake db:migrate RAILS_ENV=test'
alias reseed='rake db:reset && rake db:migrate && rake db:seed'

## General Utility
alias sgc='git config user.name "Nate Geslin" && git config user.email teamtomkins23@gmail.com'
alias python=python3
