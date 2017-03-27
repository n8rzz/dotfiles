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

" Tagbar
nmap <leader>tt :TagbarToggle<CR>
