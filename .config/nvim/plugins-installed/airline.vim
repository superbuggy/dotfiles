Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16_gruvbox_dark_pale'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

if !exists('g:airline_symbols') 
  let g:airline_symbols = {}
endif

let g:airline_symbols.dirty = '🐾'
let g:airline_symbols.notexists = '⛔'

set noshowmode

