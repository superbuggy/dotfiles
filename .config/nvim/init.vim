set number relativenumber
set hidden
set expandtab
set shiftwidth=2
set tabstop=2
set showbreak=↪\
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set wildmenu
set wildmode=longest:full,full
set termguicolors

" Will create file that doesn't exist when using gf
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vk :edit ~/.config/kitty/kitty.conf<cr>
nmap <leader>vp :NERDTreeFind ~/.config/nvim/plugins-installed/<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
nmap <leader>[ :bp<cr>
nmap <leader>] :bn<cr>

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugins-installed')

source ~/.config/nvim/plugins-installed/airline.vim
source ~/.config/nvim/plugins-installed/coc.vim
source ~/.config/nvim/plugins-installed/commentary.vim
source ~/.config/nvim/plugins-installed/context-commentstring.vim
source ~/.config/nvim/plugins-installed/editorconfig.vim
source ~/.config/nvim/plugins-installed/fugitive.vim
source ~/.config/nvim/plugins-installed/fzf.vim
source ~/.config/nvim/plugins-installed/sonokai.vim
source ~/.config/nvim/plugins-installed/nerdtree.vim
source ~/.config/nvim/plugins-installed/surround.vim
source ~/.config/nvim/plugins-installed/tidal.vim
source ~/.config/nvim/plugins-installed/visual-multi.vim
source ~/.config/nvim/plugins-installed/wordmotion.vim

call plug#end()


colorscheme sonokai

