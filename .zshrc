# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/generalassembly/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#DEFAULT_USER is undefined otherwise, for use with agnoster theme
DEFAULT_USER="$USER" 
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gs='git status'
alias gc='git commit -m'
alias gac='git add . && git commit -m'
alias gd='git diff'
alias ga='git add'
alias gb='git branch -a'
alias gp='git push'
alias gl='git log --all --decorate --graph --pretty=format:"%C(yellow)%h%Creset %C(auto)%d%Creset %Cblue%ar%Creset %Cred%an%Creset %n%w(72,1,2)%s"'
alias ghnr='open https://github.com/new'

alias t='tree -Ia "node_modules|\.git" && echo "ignoring node_modules and .git"'
alias sb='cd ~/rhizome-code-domain/sandbox/'
alias rcd='cd rhizome-code-domain'
alias lsa='ls -alGt'
alias plz=please

alias hso='http-server -o'
alias rdcms='rails db:drop db:create db:migrate db:seed'
alias r4dcms='rake db:drop db:create db:migrate db:seed'
alias ezrc='code ~/.zshrc'
alias refpro='source ~/.zshrc'
alias phpmamp='/Applications/MAMP/bin/php/php7.2.8/bin/php'
alias ..g='cd $(git rev-parse --show-toplevel)'

# WP CLI container
alias dcwp='docker-compose exec --user www-data phpfpm wp'

# Run shell in Docker Containers
## https://docs.docker.com/engine/reference/commandline/exec/#description
alias dcphpsh='docker-compose exec --user root phpfpm bash'
alias dcsqlsh='docker-compose exec --user root mysql bash'
  # alias dcsqlsh='docker exec -it local-dev_mysql_1 bash' #userless

docker-stop() { docker stop $(docker ps -a -q); }

alias dup="docker-stop && docker-compose up -d"

# container name, un/pw hardcoded
import_db() { cat $1 | pv | docker exec -i local-dev_mysql_1 mysql -uroot -ppassword wordpress }