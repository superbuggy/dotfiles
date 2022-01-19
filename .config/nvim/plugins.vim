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
source ~/.config/nvim/plugins-installed/exchange.vim
source ~/.config/nvim/plugins-installed/fugitive.vim
source ~/.config/nvim/plugins-installed/fzf.vim
source ~/.config/nvim/plugins-installed/lion.vim
source ~/.config/nvim/plugins-installed/nerdtree.vim
source ~/.config/nvim/plugins-installed/pasta.vim
source ~/.config/nvim/plugins-installed/sonokai.vim
source ~/.config/nvim/plugins-installed/surround.vim
source ~/.config/nvim/plugins-installed/tidal.vim
source ~/.config/nvim/plugins-installed/unimpaired.vim
source ~/.config/nvim/plugins-installed/visual-multi.vim
source ~/.config/nvim/plugins-installed/wordmotion.vim
source ~/.config/nvim/plugins-installed/workspaces.vim

call plug#end()
