set number
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
map gf :edit <cfile><cr>

vnoremap < <gv
vnoremap > >gv

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

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
source ~/.config/nvim/plugins-installed/editorconfig.vim
source ~/.config/nvim/plugins-installed/monokai-pro.vim
source ~/.config/nvim/plugins-installed/polyglot.vim
source ~/.config/nvim/plugins-installed/surround.vim
source ~/.config/nvim/plugins-installed/visual-multi.vim

call plug#end()

colorscheme monokai_pro
