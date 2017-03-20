#!/bin/bash

#  -------------------------------------------------------------------------
#  Filename: install.sh
#  Maintainer: Nate Geslin <teamtomkins23@gmail.com>
#  URL: http://github.com/n8rzz/dotfiles
#
#  Description:  Provide an interface for which to install various
#                dotfiles and utilities
#
#  Inspired by:
#  - http://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script
#  -------------------------------------------------------------------------

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
dir=~/dotfiles                        # dotfiles directory
backup_dir=~/dotfiles_old             # old dotfiles backup directory

initialize () {
    clear

    # change to the dotfiles directory
    cd $dir || exit
}

create_backup_dir () {
    # echo "Creating $backup_dir for backup of any existing dotfiles in ~"
    mkdir -p $backup_dir
}

install_vundle () {
  if [[ ! -d ~/.vim || ! -d ~/.vim/bundle ]]; then
    echo "${YELLOW}::: Vundle not installed.  Installing Vundle...${NC}"

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  else
      echo "${GREEN}::: Vundle already installed${NC}"
  fi
}

install_vim_plugins () {
  echo "${GREEN}::: Installing VIM plugins...${NC}"

  vim +PluginInstall +qall
}

create_backup_of_original_dotfile () {
    file=$1

    if [[ ! -e ~/."$file" ]]; then
        echo "${RED}::: $file File not found, no copy made ${NC}"
        return
    fi

    echo "${YELLOW}::: Moving $file from ~/ to $backup_dir${NC}"

    mv ~/".$file" ~/dotfiles_old/".$file"
}

create_link_to_dotfile () {
    for file in "$@"; do
        echo ""
        echo "--- --- FILENAME: $file"

        create_backup_of_original_dotfile $file

        echo "${GREEN}::: Creating symlink in home directory from ~/dotfiles/$file to $file${NC}"

        ln -s "$dir/$file" ~/".$file"
    done
}

initialize
create_backup_dir

echo "##################################################################"
echo ""
echo ""
echo ""
PS3=$'\n'"Select an item to install: "
options=("Quit" "vim/tmux" "rc files" "vimrc" "vim plugins" "vundle" "tmux" "bash" "bash_alias" "bash_profile" "railsrc" "gemrc")
select opt in "${options[@]}"
do
    case $opt in
        "Quit")
            break
            ;;
        "vim/tmux")
            install_vundle
            install_vim_plugins

            create_link_to_dotfile "vimrc"
            create_link_to_dotfile "tmux.conf"
            ;;
        "rc files")
            create_link_to_dotfile "vimrc"
            create_link_to_dotfile "railsrc"
            create_link_to_dotfile "gemrc"
            ;;
        "vimrc")
            create_link_to_dotfile "vimrc"
            ;;
        "vim plugins")
            install_vim_plugins
            ;;
        "vundle")
            install_vundle
            ;;
        "tmux")
            create_link_to_dotfile "tmux.conf"
            ;;
        "bash")
            create_link_to_dotfile "bash_alias"
            create_link_to_dotfile "bash_profile"
            ;;
        "bash_alias")
            create_link_to_dotfile "bash_alias"
            ;;
        "bash_profile")
            create_link_to_dotfile "bash_profile"
            ;;
        "railsrc")
            create_link_to_dotfile "railsrc"
            ;;
        "gemrc")
            create_link_to_dotfile "gemrc"
            ;;
        *) echo invalid option;;
    esac
done
