""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filename: .vimrc                                                         
" Maintainer: Nate Geslin  <teamtomkins23@gmail.com>
" URL: http://github.com/n8rzz/dotfiles
"
"
"   Plugins ................. Install plugins with Vundle
"   Plugin Settings ......... Plugin-specific settings

" Sections:
"   01. General ................. General Vim behavior
"   02. Events .................. General autocmd events
"   03. Theme/Colors ............ Colors, fonts, etc.
"   04. Vim UI .................. User interface behavior
"   05. Text Formatting/Layout .. Text, tab, indentation related
"   06. Custom Commands ......... Any custom command aliases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'honza/vim-snippets'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'SirVer/ultisnips'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'tomtom/tcomment_vim'

" Syntax
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/syntastic'
" Plugin 'JulesWang/css.vim' " only necessary if your Vim version < 7.4
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'

" Theme / Colors
Plugin 'geoffharcourt/one-dark.vim'

" Dependencies
" Plugin 'honza/vim-snippets'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" Ruby / Rails
Plugin 'tpope/vim-rails'
Plugin 'garbas/vim-snipmate'

" All of your Plugins must be added before the following line
call vundle#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore = ['\.swp$', '\.swo$', '.git$']
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize =25 
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:ctrlp_custom_ignore = { 'dir':'\v[\/](\.git|\.hg|\.svn|docs|node_modules|puphpet|vendor)$', 'file':'\v\.(dll|exe|so|swp)$' }
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 2
let g:javascript_doc = 'yuidoc'
let g:markdown_fenced_languages = ['css', 'html', 'less', 'javascript', 'js=javascript', 'json=javascript', 'sass', 'scss', 'xml']
let g:syntastic_error_symbol = '✗'
let g:syntastic_html_checkers = []
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_style_error_symbol = 'x'
let g:syntastic_style_warning_symbol = '!'
let g:syntastic_warning_symbol = '!'
let g:jsx_ext_required = 0

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                                               
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
filetype off                    "required
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Themes/Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
color onedark
let &showbreak='└ '

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                " show line numbers
set numberwidth=6         " make the number gutter 6 characters wide
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set hlsearch              " highlight matches
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set nohlsearch            " Don't continue to highlight searched phrases.
set ruler                 " Always show info along bottom.
set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P
set visualbell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set backspace=indent,eol,start  " backspace through everything in insert mode
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartcase             " ... unless they contain at least one capital letter
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text

" Filetypes
autocmd BufNewFile,BufRead *.handlebars,*.hbr,*.hbs,*.hbt setl ft=mustache
autocmd BufNewFile,BufRead *.json setl ft=json
autocmd BufNewFile,BufRead Vagrantfile setl ft=ruby
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS sw=4 ts=4
autocmd FileType html setl omnifunc=htmlcomplete#CompleteTags sw=4 ts=4
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS sw=4 ts=4
autocmd FileType json set sw=2 ts=2
autocmd FileType markdown setl omnifunc=htmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby set sw=2 ts=2
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
