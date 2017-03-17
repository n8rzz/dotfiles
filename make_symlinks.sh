#!/usr/bin/env bash
#  -------------------------------------------------------------------------
#  Filename: make_symlinks.sh
#  Maintainer: Nate Geslin <teamtomkins23@gmail.com>
#  URL: http://github.com/n8rzz/dotfiles
#
#  Description:  Copy and create symlinks in home directory to dotfiles in ~/dotfiles
#
#  Inspired by:
#  - https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
#  -------------------------------------------------------------------------

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc bash_aliases bash_profile railsrc gemrc gitignore eslintrc"    # list of files/folders to symlink in homedir
##########

create_dotfiles_copy () {
  # create dotfiles_old in homedir
  echo "Creating $olddir for backup of any existing dotfiles in ~"
  mkdir -p $olddir
  echo "...done"
}

move_to_dest_dir () {
  # change to the dotfiles directory
  echo "Changing to $dir directory"
  cd $dir || exit
  echo "...done"
}

create_symlinks () {
  # TODO: this should be refactored to look for an array
  if [ $1 ]; then
    fileList="$1 $2"
    echo "$1 $2"
  else
    fileList=$files
  fi

  # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
  for file in $fileList; do
      # echo "Moving any existing dotfiles from ~ to $olddir"
      # mv ~/".$file" ~/dotfiles_old/

      # if a symbolic link exists already, remove it and create a new one
      if [[ -e ~/".$file" ]]; then
        echo "::: Removing previous symbolic link to $file"
        rm ~/.$file
      fi

      echo "Creating symlink to $file in home directory."
      ln -s "$dir/$file" ~/".$file"
  done
}

install_vundle () {
  if [[ ! -d ~/.vim/bundle || ! -d ~/.vim/bundle/Vundle.vim ]]; then
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

while [ $# -gt 0  ]; do
  key="$1"
  case $key in
    # sh makesymlinks.sh -a
    # sh makesymlinks.sh --atom
    # Copy .atom folder if it doesn't exist
    -a|--atom)
      # if [[ ! -d ~/.atom ]]; then
        # move atom configs to .atom folder
      echo "Creating symlink for Atom from $dir to ~/.atom"
        # cp -R ~$dir/atom ~/.atom
      ln -s $dir/atom ~/.atom
      # else
      #   echo "Atom folder already exists, skipping copy"
      # fi
      shift
      ;;
    # sh makesymlinks.sh -vs
    # sh makesymlinks.sh --vim-simple
    # Linux specific install
    -vs|--vim-simple)
      echo "Creating symlinks for simplified .vimrc from $dir to ~/.vimrc"
      # ln -s $dir/bash_aliases ~/.bash_aliases
      # ln -s $dir/vimrc-simple ~/.vimrc
      fileList="bash_aliases vimrc"

      create_symlinks $fileList
      install_vundle
      install_vim_plugins

      shift
      ;;
    *)
      create_dotfiles_copy
      move_to_dest_dir
      create_symlinks
      install_vundle
      install_vim_plugins

      shift
      ;;
  esac
done
