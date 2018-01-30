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
  autocmd VimEnter * :DoShowMarks!
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufNewFile,BufRead *.es6 setfiletype javascript syntax=javascript
  autocmd BufNewFile,BufRead *.es7 setfiletype javascript syntax=javascript
  autocmd BufNewFile,BufRead *.tsx setfiletype typescript syntax=typescript
  " Set appropriate linters
"   autocmd BufNewFile,BufRead *.jsx let g:syntastic_javascript_jshint_exec = 'jsxhint'
"   autocmd BufNewFile,BufRead *.jsx let g:syntastic_javascript_jscs_exec = 'jsxcs'
"   autocmd BufNewFile,BufRead *.js let g:syntastic_javascript_checkers = ['jshint', 'jscs']
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
" set cul                                       " highlight current line
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
" NOTE: see plugin-settings.vim for plugin-specific keymappings
" Fast saving
nmap <leader>W :w!<cr>
" Fast force quit
nmap <leader> Q :q!<cr>
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

" reload .vimrc file without closing
nmap <leader>vc :source ~/.vimrc<CR>
