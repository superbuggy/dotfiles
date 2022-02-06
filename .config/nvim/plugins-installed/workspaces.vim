Plug 'thaerkh/vim-workspace'

let g:workspace_autocreate = 1

if !isdirectory($HOME."/.vim/sessions")
    call mkdir($HOME."/.vim/sessions", "", 0700)
endif

let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_session_disable_on_args = 1
let g:workspace_undodir= $HOME . '/.vim/undo-files'
" let g:workspace_autosave = 0
