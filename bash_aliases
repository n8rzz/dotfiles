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
# cd() { builtin cd "$@"; ls;  }
# alias cd='mkdir -p "$1" && cd $_'

## Tmux
alias tls='tmux ls'
alias ta='tmux attach-session -t'

## Git
alias gst='clear && git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gpo='git pull origin'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gpu='git push'
alias gr='git reset HEAD --hard && git clean -f -d'
# alias gdc=‘git diff --stat --color’
alias gmff='git merge --no-ff'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

## Node & NPM
alias npmi='npm cache verify && npm install'
alias npmr='npm run build && npm run test && npm run report'

## Rails
alias migrate='rake db:migrate && rake db:migrate RAILS_ENV=test'
alias reseed='rake db:reset && rake db:migrate && rake db:seed'

## General Utility
alias sgc='git config user.name "Nate Geslin" && git config user.email teamtomkins23@gmail.com'

alias ni='npm install --verbose'
alias naproxy="npm config set proxy http://'ADEBPGESLINA:10%40Beech7%23'@fhdcproxy.verizon.com:80"
alias nrproxy='npm config rm proxy'
