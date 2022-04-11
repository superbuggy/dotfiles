set number
set hidden
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set showbreak=↪\
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set wildmenu
set wildmode=longest:full,full
set hlsearch
set ignorecase
set cursorline
set cursorcolumn
set incsearch " https://stackoverflow.com/a/1295244/6417007
syntax on

if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/backups")
    call mkdir($HOME."/.vim/backups", "", 0700)
endif
if !isdirectory($HOME."/.vim/undo-files")
    call mkdir($HOME."/.vim/undo-files", "", 0700)
endif
set undodir=~/.vim/undo-files
set undofile
set backup
set backupdir=~/.vim/backups

source ~/.config/nvim/commands.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/post-plugin-load-config.vim
source ~/.config/nvim/theming.vim

