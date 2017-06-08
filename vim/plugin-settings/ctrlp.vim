" kien/ctrlp.vim
"""""""""""

let g:ctrlp_max_files = 50000
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|coverage\|test\|docs\|.nyc_output'
