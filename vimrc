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
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-bufferline'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-repeat'
Plugin 'tomtom/tcomment_vim'
Plugin 'wesQ3/vim-windowswap'

" Syntax
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'editorconfig/editorconfig-vim'

" Language
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'isRuslan/vim-es6'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'ap/vim-css-color'

" Ruby / Rails
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'

" Syntax
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'tomasiser/vim-code-dark'

" Dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

call vundle#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrooloose/nerdtree
"""""""""""
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore = ['\.swp$', '\.swo$', '.git$', '.idea$']
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 35

" terryma/vim-multiple-cursors
"""""""""""

" Default mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<S-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" airblade/vim-gitgutter
"""""""""""
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 0

" scrooloose/syntastic
"""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_html_checkers = []
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_style_error_symbol = 'x'
let g:syntastic_style_warning_symbol = '!'
let g:syntastic_warning_symbol = '!'

" kien/ctrlp.vim
"""""""""""
let g:ctrlp_max_files = 10000
let g:ctrlp_custom_ignore = { 'dir':'\v[\/](\.git|\.hg|\.svn|docs|node_modules|puphpet|vendor)$', 'file':'\v\.(dll|exe|so|swp)$' }

" nathanaelkane/vim-indent-guides
"""""""""""
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" bling/vim-airline
"""""""""""
let g:airline_theme='codedark'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on                     " load file type plugins + indentation
set autoread
set encoding=utf8                             " set standard encoding to en_US
set hidden                                    " allow buffers to be hidden
set nobackup                                  " disallow backup files
set nocompatible                              " get rid of Vi compatibility mode. SET FIRST!
set noswapfile                                " disallow swap files
set showcmd                                   " display incomplete commands

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent                                " auto-indent
set backspace=indent,eol,start                " backspace through everything in insert mode
set expandtab                                 " use spaces instead of tabs
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " highlight whitespaces
set nowrap                                    " don't wrap text
set tabstop=2                                 " tab spacing
set softtabstop=2                             " unify
set shiftwidth=2                              " indent/outdent by 2 columns
set shiftround                                " always indent/outdent to the nearest tabstop
set smartindent                               " automatically insert one extra level of indentation
set smarttab                                  " use tabs at the start of a line, spaces elsewhere

if has("autocmd")
  " Enable filetype plugin
  " filetype plugin on
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufNewFile,BufRead *.es6 setfiletype javascript syntax=javascript
  autocmd BufNewFile,BufRead *.es7 setfiletype javascript syntax=javascript
  autocmd BufNewFile,BufRead *.tsx setfiletype typescript syntax=typescript
  " Set appropriate linters
  autocmd BufNewFile,BufRead *.jsx let g:syntastic_javascript_jshint_exec = 'jsxhint'
  autocmd BufNewFile,BufRead *.jsx let g:syntastic_javascript_jscs_exec = 'jsxcs'
  autocmd BufNewFile,BufRead *.js let g:syntastic_javascript_checkers = ['jshint', 'jscs']
  " Treat .md files as .markdown
  autocmd BufNewFile,BufRead *.md set syntax=markdown

  " Enable emmet for JavaScript and CSS files
  " autocmd FileType html,css EmmetInstall
  " Indentation for CSS files
  " autocmd BufNewFile,BufRead *.css,*.html,*.js,*.jsx,*.json,*.py
  autocmd FileType ruby setlocal sw=2 ts=2 sts=2
  autocmd Filetype html setlocal ts=4 sw=4 expandtab
  autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
  autocmd FileType css setlocal sw=4 ts=4 expandtab
  autocmd FileType scss setlocal sw=4 ts=4 expandtab
  autocmd BufWritePre *.{rb,js,json,html,sh,bash}, %s/\s\+$//e
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cmdheight=2                               " height of the command bar
set cul                                       " highlight current line
set hlsearch                                  " highlight matches
set incsearch                                 " But do highlight as you type your search.
set ignorecase                                " Make searches case-insensitive.
set laststatus=2                              " last window always has a statusline
set nohlsearch                                " Don't continue to highlight searched phrases.
set number                                    " show line numbers
set numberwidth=6                             " set gutter width by number of characters
set ruler                                     " Always show info along bottom.
set showmatch                                 " show matching bracket
set smartcase                                 " ... unless they contain at least one capital letter
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set title                                     " show filename in window titlebar
set visualbell                                " disable audio warnings
set relativenumber                            " show line numbers relative to cursor position
set number                                    " show actual line number for cursor line
let &showbreak='└ '                           " set line break symbol
" set cursorcolumn

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

set background=dark
set t_Co=256
set t_ut=
colorscheme codedark 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06 Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>W :w!<cr>

" Toggle NERDTree
nnoremap <Leader>n :NERDTreeTabsToggle<CR>
" Move to left window
nnoremap <Leader>H <C-W>h<CR>
" Move to right window
nnoremap <Leader>L <C-W>l<CR>

" This replaces :tabnew
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
" Close all bufers
nmap <leader>bqa :bufdo bd<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :call VisualSelection('f', '')<CR>
" vnoremap <silent> # :call VisualSelection('b', '')<CR>
