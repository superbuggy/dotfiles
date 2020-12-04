# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# phpcs --config-set installed_paths ~/php-utilities/WordPress-Coding-Standards

# Path to your oh-my-zsh installation.
export ZSH="/Users/reichard/.oh-my-zsh"
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

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
alias gd='git diff'
alias ga='git add'
alias gb='git branch -a'
alias gp='git push'
alias gl='git log --all --decorate --graph --pretty=format:"%C(yellow)%h%Creset %C(auto)%d%Creset %Cblue%ar%Creset %Cred%an%Creset %n%w(72,1,2)%s"'
alias ghnr='open https://github.com/new'

alias t='tree -Ia "node_modules|\.git" && echo "ignoring node_modules and .git"'
alias sb='cd ~/wamu/sandbox/'
alias rcd='cd rhizome-code-domain'
alias lsa='ls -alGt'
alias plz=sudo

alias hso='http-server -o'
alias rdcms='rails db:drop db:create db:migrate db:seed'
alias r4dcms='rake db:drop db:create db:migrate db:seed'
alias ezrc='code ~/.zshrc'
alias xls='exa --long --header --git'
alias ls='xls -a'
alias refpro='source ~/.zshrc'
alias acki='ack --ignore-file=match:/\.svg\|\.scss\|app\.\|\.css/'

# Docker

### https://docs.docker.com/engine/reference/commandline/exec/#description
alias dcwp='docker-compose exec --user www-data phpfpm wp'
alias dcphpsh='docker-compose exec --user root phpfpm bash'
alias dcsqlsh='docker-compose exec --user root mysql bash'
alias dup="docker-compose stop && docker-compose up -d"
alias dcls="docker container ls"
alias dcps="docker-compose ps"
alias dstop="docker stop $(docker ps -aq)"
alias cachebust="dcwp cache flush && dcwp transient delete --all"



alias ngrok="~/ngrok"
# Lando

function lwp () {
  lando wp "$@" --path=/app/wproot
}

alias lcachebust="lwp cache flush && lwp transient delete --all"


lint10up() {
  npm install @10up/eslint-config --save-dev
  echo `{\n\"extends\": \"@10up/eslint-config\"\n}` > ./.eslintrc
}

## SSH Aliases

alias kns="ssh kns -t 'cd ~/sites/thekojonnamdishow.org; bash --login'"
alias knsstage="ssh kns-stage -t 'cd ~/sites/stage.thekojonnamdishow.org; bash --login'"
alias drs="ssh drs -t 'cd ~/sites/dianerehm.org; bash --login'"
alias drsstage="ssh drs-stage -t 'cd ~/sites/stage.dianerehm.org; bash --login'"
alias 1a="ssh 1a -t 'cd ~/sites/legacy.the1a.org; bash --login'"
alias 1astage="ssh 1a-stage -t 'cd ~/sites/stage.the1a.org; bash --login'"
alias wamums="ssh ms -t 'cd ~/sites; bash --login'"
alias dcist="ssh ms -t 'cd ~/sites/beta.wamu.org; bash --login'"
alias gunpushed="git log --branches --not --remotes --no-walk --decorate --oneline"




## Dir aliases

alias wamut="cd ~/wamu/multisite-local/wordpress/wp-content/themes/wamu"
alias wamup="cd ~/wamu/multisite-local/wordpress/wp-content/plugins"
alias ewamut="code ~/wamu/multisite-local/wordpress/wp-content/themes/wamu"
alias ewamup="code ~/wamu/multisite-local/wordpress/wp-content/plugins"
alias wamulando="cd ~/wamu/lando/mu-hub-stack/web"

alias pbfy="phpcbf --standard=WordPress-Extra"
alias pphpunit='$(pwd)/vendor/phpunit/phpunit/phpunit'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function gjnb() {
  git checkout master-hub
  git checkout -b "$1/WAMU2-$2-$3"
}

function vcr() {
  vssh -- -t $1
}

function txtcurl() {
  curl $1 | sed 's/<\/*[^>]*>//g'
}

alias vssh="vagrant ssh"
function tail_vv_project() {
	vssh -- -t "sudo tail -f /srv/www/$1/htdocs/wp-content/debug.log"
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source /Users/reichard/.rvm/scripts/rvm

export PATH="/usr/local/sbin:$PATH"
