export N_PREFIX=$HOME/.node
export PATH=$N_PREFIX/bin:$PATH
ulimit -n 1024

# source ~/.profile

[[ -s "$HOME/.rvm/scripts/rvm"  ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

######
# Folder Traversal
######
# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

######
# GIT
######
# Git commands
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
# alias gdc=‘git diff --stat --color’
alias gmff='git merge --no-ff'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

######
# UTIL ALIAS
#####
alias el='./node_modules/.bin/eslint src'
alias sgc='git config user.name "Nate Geslin" && git config user.email teamtomkins23@gamil.com'

# Tab complete for git branch names
# source ~/git-completion.bash
# if [ -f ~/.git-completion.bash  ]; then
#     . ~/.git-completion.bash
# fi

# add the following lines to your ~/.bash_profile:
if [ -f $(brew --prefix)/etc/bash_completion  ]; then
  . $(brew --prefix)/etc/bash_completion
fi


# Git branch name in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[35m\]\$(parse_git_branch)\[\033[00m\] $ "

# Show dirty state in prompt when in Git repos
export GIT_PS1_SHOWDIRTYSTATE=1

