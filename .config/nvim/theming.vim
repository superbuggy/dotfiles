if (has("termguicolors"))
  set termguicolors
endif
set background=dark " or light if you want light mode
colorscheme gruvbox

let g:gruvbox_italic=1

filetype plugin on

" Syntax checking helper function

com! SynCh echo {l,c,n ->
        \   'hi<'    . synIDattr(synID(l, c, 1), n)             . '> '
        \  .'trans<' . synIDattr(synID(l, c, 0), n)             . '> '
        \  .'lo<'    . synIDattr(synIDtrans(synID(l, c, 1)), n) . '> '
        \ }(line("."), col("."), "name")
