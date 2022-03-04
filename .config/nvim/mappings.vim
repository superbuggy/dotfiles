let mapleader = "\<space>"

noremap <leader>* :let @/ = "" <CR>
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vk :edit ~/.config/kitty/kitty.conf<cr>
nmap <leader>vp :edit ~/.config/nvim/plugins.vim<cr>
nmap <leader>vm :edit ~/.config/nvim/mappings.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
nmap <leader>[ :bp<cr>
nmap <leader>] :bn<cr>
nmap <leader>`f :Format<cr>:ESLFix<cr>

nmap ;r :call ToggleRelativeNumber()<CR>

" Will create file that doesn't exist when using gf
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

