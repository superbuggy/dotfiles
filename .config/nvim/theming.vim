set background=dark " or light if you want light mode
let g:gruvbox_italic=1
colorscheme gruvbox
Plug 'andymass/vim-matchup'


filetype plugin on
com! SynCh echo {l,c,n ->
        \   'hi<'    . synIDattr(synID(l, c, 1), n)             . '> '
        \  .'trans<' . synIDattr(synID(l, c, 0), n)             . '> '
        \  .'lo<'    . synIDattr(synIDtrans(synID(l, c, 1)), n) . '> '
        \ }(line("."), col("."), "name")
