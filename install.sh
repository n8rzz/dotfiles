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

# $1 - color or color var
# $2 - msg
print_line_with_color () {
    echo "$1 $2${NC}"
}

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

install_nvm () {
    if ! type "nvm" &> /dev/null; then
        print_line_with_color "${GREEN}" "::: nvm already installed"
    else
        print_line_with_color "${GREEN}" "::: nvm not installed, installing nvm"

        curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    fi
}

install_vim_plugins () {
    print_line_with_color "${GREEN}" "::: Installing VIM plugins"

    vim +PluginInstall +qall
}

install_omzsh () {
    print_line_with_color "${GREEN}" "::: Installing Oh My Zsh"

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_zsh_theme () {
    print_line_with_color "${GREEN}" "::: Installing Spaceship zsh theme"

    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
}

install_powerline_fonts () {
    print_line_with_color "${GREEN}" "::: Installing Powerline Fonts"

    git clone https://github.com/powerline/fonts.git ~/Documents/fonts
    ~/Documents/fonts/install.sh
}

create_backup_of_original_dotfile () {
    file=$1

    if [[ ! -e ~/."$file" ]]; then
        print_line_with_color "${YELLOW}" "::: $file File not found, no backup copy made"
        return
    fi

    print_line_with_color "${YELLOW}" "::: Moving $file from ~/ to $backup_dir"

    mv ~/".$file" ~/dotfiles_old/".$file"
}

create_link_to_dotfile () {
    for file in "$@"; do
        srcname=$file
        destname=$file

        print_line_with_color ""
        print_line_with_color "--- --- FILENAME: $srcname"

        create_backup_of_original_dotfile "$srcname"

        print_line_with_color "${GREEN}" "::: Creating symlink in home directory from ~/dotfiles/$srcname to $destname"

        if [[ -L ~/."$destname" ]]; then
          print_line_with_color "${YELLOW}" "::: Replacing existing ${destname} with new file"

          rm ~/".$destname"
        fi

        ln -s "$dir/$srcname" ~/".$destname"
    done
}

remove_all_symlinks () {
  fileList=("vimrc" "tmux" "bash_aliases" "bash_profile" "railsrc" "gemrc" "zshrc")

  for file in "${fileList[@]}"; do
    if [[ ! -L ~/."$file" ]]; then
      continue
    fi

        print_line_with_color "${RED}" "::: Removing $file from ~/dotfiles/$file"

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
options=("vim/tmux" "bash" "rc files" "vim plugins" "vundle" "vimrc" "tmux" "nvm" "bash_aliases" "bash_profile" "oh-my-zsh" "zsh" "zshrc" "railsrc" "gemrc" "REMOVE ALL" "QUIT")
select opt in "${options[@]}"
do
    case $opt in
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
        "nvm")
            install_nvm
            ;;
        "tmux")
            create_link_to_dotfile "tmux.conf"
            ;;
        "bash_aliases")
            create_link_to_dotfile "bash_aliases"
            ;;
        "bash_profile")
            create_link_to_dotfile "bash_aliases"
            create_link_to_dotfile "bash_profile"
            ;;
        "oh-my-zsh")
            install_omzsh
            ;;
        "zshrc")
            create_link_to_dotfile "zshrc"
            ;;
        "zsh")
            install_zsh_theme
            install_powerline_fonts

            create_link_to_dotfile "zshrc"
            ;;
        "railsrc")
            create_link_to_dotfile "railsrc"
            ;;
        "gemrc")
            create_link_to_dotfile "gemrc"
            ;;
        "REMOVE ALL")
            remove_all_symlinks
            ;;
        "QUIT")
            break
            ;;
        *) echo invalid option;;
    esac
done
