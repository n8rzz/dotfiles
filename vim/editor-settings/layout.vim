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
