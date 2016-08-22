## Make It Awesome
```bash
make_it_awesome.sh
```
Run on a new Mac and get ready for awesomeness!

#### Brew
- bash-completion
- git
- git-flow
- heroku-toolbelt
- postgresql

#### Cask
- atom
- blender
- dropbox
- google-chrome
- iterm2
- macvim
- pgadmin3
- postman
- slack
- spectacle
- sourcetree
- unity
- vagrant
- virtualbox
- virtualbox-extension-pack


## Symlinks
Create symlinks by running
 ```bash
 make_symlinks.sh (-a|--atom)
 ```

 ```-a | --atom``` creates a symlink from ```~/dotfiles/atom``` to ```~/.atom```.  This will copy all config ```.cson``` files and the [package-sync](https://atom.io/packages/package-sync) package file that will allow re-syncing of packages.

 The following dotfiles will be copied to your root directory:
```bash
.bash_profile
.eslintrc
.gemrc
.gitignore
.railsrc
.vimrc
```
