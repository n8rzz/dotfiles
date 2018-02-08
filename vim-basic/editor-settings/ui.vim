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
