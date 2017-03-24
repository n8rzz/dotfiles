""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filename: .vimrc-simple
" Maintainer: Nate Geslin  <teamtomkins23@gmail.com>
" URL: http://github.com/n8rzz/dotfiles
"
"
" Plugins ....................... Install plugins with Vundle
" Plugin Settings ............... Plugin-specific settings

" Sections:
"   01. General ................. General Vim behavior
"   02. Events .................. General autocmd events
"   03. Formatting/Layout ....... Text, tab, indentation related
"   04. Vim UI .................. User interface behavior
"   05. Syntax .................. Colors, fonts, etc.
"   06. Key Mappings ............ Commands mapped to keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install Vundle and plugins
execute 'source ~/dotfiles/vim/plugins.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Import settings files
for f in glob('~/dotfiles/vim/settings/*.vim', 0, 1)
    execute 'source' f
endfor


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute 'source ~/dotfiles/vim/editor-settings/general.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute 'source ~/dotfiles/vim/editor-settings/layout.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute 'source ~/dotfiles/vim/editor-settings/ui.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute 'source ~/dotfiles/vim/editor-settings/syntax.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06 Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute 'source ~/dotfiles/vim/editor-settings/keyMapping.vim'
