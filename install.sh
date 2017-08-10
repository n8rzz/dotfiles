#!/bin/bash

#  -------------------------------------------------------------------------
#  Filename: install.sh
#  Maintainer: Nate Geslin <teamtomkins23@gmail.com>
#  URL: http://github.com/n8rzz/dotfiles
#
#  Description:  Provide an interface for which to install various
#                dotfiles and utilities
#
#  Usage: from the home directory run `bash ~/dotfiles/install.sh`
#
#  Selection UI inspired by:
#  - http://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script
#  -------------------------------------------------------------------------

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
dir=~/dotfiles                        # dotfiles directory
backup_dir=~/dotfiles_old             # old dotfiles backup directory
atomDir=~/.atom                       # atom configuration directory

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
    echo "${YELLOW}::: Vundle not installed, installing Vundle${NC}"

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  else
      echo "${GREEN}::: Vundle already installed${NC}"
  fi
}

install_vim_plugins () {
  echo "${GREEN}::: Installing VIM plugins${NC}"

  vim +PluginInstall +qall
}

copy_atom_dir () {
  shouldOverwrite=$1

  if [ -d $atomDir ] && [ $shouldOverwrite ]; then
      echo "${YELLOW}::: $atomDir already exists, removing dir before copy${NC}"

      rm -rf $atomDir
  fi

  echo "${GREEN}::: Copying Atom directory${NC}"

  cp -r $dir/'atom' $atomDir
}

create_backup_of_original_dotfile () {
    file=$1

    if [[ ! -e ~/."$file" ]]; then
        echo "${YELLOW}::: $file File not found, no backup copy made ${NC}"
        return
    fi

    echo "${YELLOW}::: Moving $file from ~/ to $backup_dir${NC}"

    mv ~/".$file" ~/dotfiles_old/".$file"
}

create_link_to_dotfile () {
    for file in "$@"; do
        echo ""
        echo "--- --- FILENAME: $file"

        create_backup_of_original_dotfile "$file"

        echo "${GREEN}::: Creating symlink in home directory from ~/dotfiles/$file to $file${NC}"

        ln -s "$dir/$file" ~/".$file"
    done
}

# verify_or_create_sublime_text_user_dir() {
#   if [[ -d ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ]]; then
#     return
#   fi
#
#   echo "${YELLOW}::: User dir not found, creating it now${NC}"
#
#   mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
# }
#
# copy_sublime_text_3_user_dir () {
#   if [[ ! -d ~/Library/Application\ Support/ && ! -d ~/Library/Application\ Support/Sublime\ Text\ 3/ ]]; then
#     echo "${YELLOW}::: Sublime Text 3 not found, user settings not copied${NC}"
#   fi
#
#   verify_or_create_sublime_text_user_dir
#
#   echo "${GREEN}::: Copying ~/dotfiles/sublimeText3/User to Sublime Text 3/Packages/User${NC}"
#
#   cp -R "$dir/sublimeText3/User/." "~/Library/Application Support/Sublime Text 3/Packages/User/"
# }

remove_atom_dir () {
  if [[ ! -d $atomDir ]]; then
    echo "${YELLOW}::: $atomDir does not exist, nothing to remove${NC}"
  fi
}

remove_all_symlinks () {
  fileList=("vimrc" "tmux" "bash_aliases" "bash_profile" "railsrc" "gemrc")

  for file in "${fileList[@]}"; do
    if [[ ! -L ~/."$file" ]]; then
      continue
    fi

    echo "${RED}::: Removing $file from ~/dotfiles/$file${NC}"

    rm ~/."$file"
  done
}

initialize
create_backup_dir

echo "##################################################################"
echo ""
echo ""
echo ""
PS3=$'\n'"Select an item to install: "
options=("atom" "vim/tmux" "bash" "rc files" "vim plugins" "vundle" "vimrc" "tmux" "bash_aliases" "bash_profile" "railsrc" "gemrc" "REMOVE ALL" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "atom")
            copy_atom_dir true
            ;;
        # "sublime text 3")
        #     copy_sublime_text_3_user_dir
        #     ;;
        "vim/tmux")
            install_vundle
            install_vim_plugins

            create_link_to_dotfile "vimrc"
            create_link_to_dotfile "tmux.conf"
            ;;
        "bash")
            create_link_to_dotfile "bash_aliases"
            create_link_to_dotfile "bash_profile"
            ;;
        "rc files")
            create_link_to_dotfile "vimrc"
            create_link_to_dotfile "railsrc"
            create_link_to_dotfile "gemrc"
            ;;
        "vim plugins")
            install_vim_plugins
            ;;
        "vundle")
            install_vundle
            ;;
        "vimrc")
            create_link_to_dotfile "vimrc"
            ;;
        "tmux")
            create_link_to_dotfile "tmux.conf"
            ;;
        "bash_aliases")
            create_link_to_dotfile "bash_aliases"
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
        "REMOVE ALL")
            remove_atom_dir
            remove_all_symlinks
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
