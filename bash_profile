#!/usr/bin/env bash
#  -------------------------------------------------------------------------
#  Filename: .bash_profile
#  Maintainer: Nate Geslin  <teamtomkins23@gmail.com>
#  URL: http://github.com/n8rzz/dotfiles
#
#  Description:  BASH configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Terminal Command Aliases
#  3.   File and Folder Management
#  4.   Searching
#  5.   Process Management
#  6.   Networking
#  7.   System Operations & Information
#  8.   Web Development
#  9.   Reminders & Notes
#
#  Inspired by:
#  - https://gist.github.com/natelandau/10654137
#  -------------------------------------------------------------------------


#  -------------------------------------------------------------------------
#  1. Environment Configuration
#  -------------------------------------------------------------------------
# export N_PREFIX=$HOME/.node
# export PATH=$N_PREFIX/bin:$PATH
# ulimit -n 10480
# export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cacert.pem

# source ~/.profile
source ~/.bash_aliases

# Load RVM into a shell session *as a function*
# shellcheck source=/dev/null
[[ -s "$HOME/.rvm/scripts/rvm"  ]] && source "$HOME/.rvm/scripts/rvm"
# shellcheck source=/dev/null
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#  -------------------------------------------------------------------------
#  2. ALIASES
#  -------------------------------------------------------------------------

# see bash_aliases for alias definitions

## Change commit email for all commits belonging to author
# git filter-branch -f --commit-filter 'if [ "$GIT_AUTHOR_NAME" = "Nate Geslin"  ];
#   then export GIT_AUTHOR_NAME="Nate Geslin"; export GIT_AUTHOR_EMAIL=teamtomkins23@gmail.com;
#   fi; git commit-tree "$@"'

# Tab completion
# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#   # shellcheck source=/dev/null
#   . $(brew --prefix)/etc/bash_completion
#
#   # add aliased git commands here to be recognized by tab complete
#   # __git_complete gco _git_checkout
# fi

# Git branch name in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# export PS1="\u@\h \W\[\033[35m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\u \[\033[032m\]:::\[\033[0m\] \w\[\033[35m\]\$(parse_git_branch())\[\033[00m\] $ "

# Show dirty state in prompt when in Git repos
export GIT_PS1_SHOWDIRTYSTATE=1


#  -------------------------------------------------------------------------
#  3.   File and Folder Management
#  -------------------------------------------------------------------------
#  -------------------------------------------------------------------------
#  4.   Searching
#  -------------------------------------------------------------------------
#  -------------------------------------------------------------------------
#  5.   Process Management
#  -------------------------------------------------------------------------
#  Find memory hogs
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#  cpuHogs:  Find CPU hogs
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'


#  -------------------------------------------------------------------------
#  6.   Networking
#  -------------------------------------------------------------------------
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs


#  -------------------------------------------------------------------------
#  7.   System Operations & Information
#  -------------------------------------------------------------------------
# cleanupDS:  Recursively delete .DS_Store files
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# finderShowHidden:   Show hidden files in Finder
# finderHideHidden:   Hide hidden files in Finder
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#  -------------------------------------------------------------------------
#  8.   Web Development
#  -------------------------------------------------------------------------
#  -------------------------------------------------------------------------
#  9.   Reminders & Notes
#  -------------------------------------------------------------------------

export N_PREFIX="$HOME/.node"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
