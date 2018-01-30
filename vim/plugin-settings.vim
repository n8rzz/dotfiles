"""""""""""
" scrooloose/nerdtree
"""""""""""
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.swp$', '\.swo$', '.idea$']
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=35

nnoremap <Leader>n :NERDTreeTabsToggle<CR>

"""""""""""
" airblade/vim-gitgutter
"""""""""""
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 0

"""""""""""
" nathanaelkane/vim-indent-guides
"""""""""""
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

"""""""""""
" vim-airline/vim-airline
"""""""""""
" let g:airline_theme='codedark'
let g:airline_theme='deus'

"""""""""""
" bling/vim-bufferline
"""""""""""
let g:bufferline_echo = 1
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
let g:bufferline_modified = '+'
let g:bufferline_show_bufnr = 1

"""""""""""
" majutsushi/tagbar
"""""""""""
" nmap <leader>tt :TagbarToggle<CR>

"""""""""""
" junegunn/fzf
"""""""""""
nmap <C-p> :FZF<CR>
