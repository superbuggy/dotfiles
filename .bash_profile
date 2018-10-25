function ..() {
  LIMIT=$1
  if ! [ "$LIMIT" ]; then
    LIMIT=1;
  fi
  P=$PWD
  for ((i=1; i <= LIMIT; i++))
  do
    P=$P/..
  done
  cd $P
  export MPWD=$P
}

function cra() {
  create-react-app $1
  cd $1
  rm src/App.css src/App.css src/App.test.js src/logo.svg
  printf "import React, { Component } from 'react'\n\nclass App extends Component {\n  render() {\n    return (\n      <div>\n        {  }\n      </div>\n    )\n  }\n}\n\nexport default App" > src/App.js
  code .
}

export GITHUB_USERNAME='superbuggy'
export PATH="/usr/local/bin:$PATH"EDITOR=code
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

## Hide/Show Mac OS X Doc

function showdock() {
  defaults delete com.apple.dock autohide-delay; killall Dock
}

function hidedock() {
  defaults write com.apple.dock autohide-delay -float 1000; killall Dock
}

## Deployment

### Netlify
function dpl() {
  git add .
  git commit -m "$1"
  gp origin master
  npm run build
  netlifyctl deploy
}


### GitHub Pages deploy script for superbuggy.github.io
function ghpb() {
  git checkout master
  ga .
  gc "$1"
  gp
  yarn build
  git checkout build
  rm -rf static
  mv build/* .
  ga .
  gc "$1"
  gp ghp build:master
  git checkout master
}

## GIT

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

alias hso='http-server -o'
alias rdcms='rails db:drop db:create db:migrate db:seed'
alias r4dcms='rake db:drop db:create db:migrate db:seed'
alias ebp='code ~/.bash_profile'
alias refpro='source ~/.bash_profile'

set_prompts() {
  local black="" blue="" bold="" cyan="" green="" orange="" \
  purple="" red="" reset="" white="" yellow=""

  local dateCmd=""

  if [ -x /usr/bin/tput ] && tput setaf 1 &> /dev/null; then
    # Reset colors
    tput sgr0
    bold=$(tput bold)
    reset=$(tput sgr0)

    # Solarized colors
    # (https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized#the-values)
    black=$(tput setaf 0);    blue=$(tput setaf 33);
    cyan=$(tput setaf 37);    green=$(tput setaf 190);
    orange=$(tput setaf 172); yellow=$(tput setaf 136);
    purple=$(tput setaf 141); red=$(tput setaf 124);
    violet=$(tput setaf 61);  magenta=$(tput setaf 9);
    white=$(tput setaf 8);
  else
    bold=""
    black="\e[1;30m";   blue="\e[1;34m";   cyan="\e[1;36m"; orange="\e[1;33m";  purple="\e[1;35m"; red="\e[1;31m";   magenta="\e[1;31m"; violet="\e[1;35m"; white="\e[1;37m"; yellow="\e[1;33m";  green="\e[1;32m";  reset="\e[0m";
  fi

  # Only show username/host if not default
  function usernamehost() {

    # Highlight the user name when logged in as root.
    if [[ "${USER}" == *"root" ]]; then
      userStyle="${red}";
    else
      userStyle="${magenta}";
    fi;

    userhost=""
    userhost+="\[${userStyle}\]$USER "
    userhost+="${white}at "
    userhost+="${orange}$HOSTNAME "
    userhost+="${white}in"

    if [ $USER != "$default_username" ]; then echo $userhost ""; fi
  }


  function prompt_git() {
    # this is >5x faster than mathias's.

    # check if we're in a git repo. (fast)
    git rev-parse --is-inside-work-tree &>/dev/null || return

    # check for what branch we're on. (fast)
    #   if… HEAD isn’t a symbolic ref (typical branch),
    #   then… get a tracking remote branch or tag
    #   otherwise… get the short SHA for the latest commit
    #   lastly just give up.
    branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
    git describe --all --exact-match HEAD 2> /dev/null || \
    git rev-parse --short HEAD 2> /dev/null || \
    echo '(unknown)')";


    ## early exit for Chromium & Blink repo, as the dirty check takes ~5s
    ## also recommended (via goo.gl/wAVZLa ) : sudo sysctl kern.maxvnodes=$((512*1024))
    repoUrl=$(git config --get remote.origin.url)
    if grep -q chromium.googlesource.com <<<$repoUrl; then
      dirty=" ⁂"
    else
      # check if it's dirty (slow) technique via github.com/git/git/blob/355d4e173/contrib/completion/git-prompt.sh#L472-L475
      dirty=$(git diff --no-ext-diff --quiet --ignore-submodules --exit-code || echo -e "*")

      # Check for untracked files.
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        dirty+='†';
      fi;

      # Check for stashed files.
      if $(git rev-parse --verify refs/stash &>/dev/null); then
        dirty+='§';
      fi;

    fi

    [ -n "${s}" ] && s=" [${s}]";
    echo -e "${1}${branchName}${2}$dirty";

    return
  }
  ################## | Prompt string | ##################

  # terminal title (set to the current working directory)
  PS1="\[\033]0;\w\007\]"
  PS1+="\n\[$bold\]"
  # PS1+="\[$(usernamehost)\]" # username at host
  PS1+="\[$green\]\w" # working directory
  PS1+="\$(prompt_git \"$white on $purple\" \"$cyan\")" # git repository details
  PS1+="\n"
  PS1+="\[$reset$white\]\\$ \[$reset\]"
  export PS1
}

set_prompts; unset set_prompts;

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
