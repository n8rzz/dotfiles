#!/usr/bin/env bash
#  -------------------------------------------------------------------------
#  Filename: make_it_awesome_liunx.sh
#  Maintainer: Nate Geslin <teamtomkins23@gmail.com>
#  URL: http://github.com/n8rzz/dotfiles
#
#  Description:  From fresh Linux to Awesome Linux! Upgrade or install system pkgs
#  -------------------------------------------------------------------------

update_system() {
  apt-get update
}

# install_guest_additions() {
#   # guest additions
#   apt-get -y install gcc make linux-headers-"$(uname -r)"
#   mount /dev/sr0 /media/cdrom
#   /media/cdrom/VBoxLinuxAdditions.run
#   usermod -g vboxsf "$USER"
# }

install_additional_pkgs() {
  apt-get install git vim bash tmux

  # install n
  curl -L https://git.io/n-install | bash
}


while [ $# -gt 0  ]; do
  key="$1"
  case $key in
    # sh makesymlinks.sh -b
    # sh makesymlinks.sh --base
    # Updates system and install only guest additions
    -b|--base)
      update_system
      # install_guest_additions

      shift
      ;;
    *)
      update_system
      install_guest_additions
      install_additional_pkgs

      shift
      ;;
  esac
done
