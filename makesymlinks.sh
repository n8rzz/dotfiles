#!/bin/bash
############################
# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#
# Taken from: https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
############################

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc bash_profile railsrc gemrc"    # list of files/folders to symlink in homedir
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_vundle () {
  if [[ ! -d ~/.vim || ! -d .vim ]]; then
    echo "Vundle not installed.  Installing Vundle..."
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "done"
  fi
}

install_vim_plugins () {
  echo "Installing VIM plugins..."
  vim +PluginInstall +qall
  echo "...done"
}

install_vundle
install_vim_plugins


while [ $# -gt 0  ]; do
  key="$1"
  case $key in
    # sh makesymlinks.sh -a
    # sh makesymlinks.sh --atom
    # Copy .atom folder if it doesn't exist
    -a|--atom)
      if [[ ! -d ~/.atom ]]; then
        # move atom configs to .atom folder
        echo "Moving atom from ~ to $dir"
        mv ~$dir/atom ~/.atom
      else
        echo "Atom folder already exists, skipping copy"
      fi
      shift
      ;;
    *)
      shift
      ;;
  esac
done

