#!/usr/bin/env zsh

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# prezto theme
fpath=("$dev/dotfiles/terminal" $fpath)
autoload -Uz promptinit && promptinit
prompt 'gjl'

# Highlight overides
ZSH_HIGHLIGHT_STYLES[path]='none'

# Customize to your needs...
export GREP_OPTIONS='--color=auto'
export EDITOR='subl -w'

# virtualenvwrapper
# export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
# export PIP_VIRTUALENV_BASE=$WORKON_HOME
# export PIP_RESPECT_VIRTUALENV=true

#node
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"

# Useful global aliases.
alias -g 'H'='| head'     # git log H
alias -g 'T'='| tail'     # git log T
alias -g 'F'='| head -n'  # git log F 15
alias -g 'L'='| tail -n'  # git log L 10
alias -g 'C'='| wc -l'    # git log C

# Git Alias overrides
# Log (l)
alias git=hub
alias gl='git log --pretty=format:${_git_log_medium_format}'
alias gls='git log --stat --pretty=format:${_git_log_medium_format}'
alias gld='git log --stat --patch --full-diff --pretty=format:${_git_log_medium_format}'
alias glo='git log'
alias glg='git log --all --graph --pretty=format:${_git_log_oneline_format}'
alias glb='git log --pretty=format:${_git_log_brief_format}'
alias glc='git shortlog --summary --numbered'

# restart pow
alias powpow='powder down && powder up'

# Some OS X-only stuff.
if [[ "$OSTYPE" == darwin* ]]; then
  # Short-cuts for copy-paste.
  alias c='pbcopy'
  alias p='pbpaste'

  # Lock current session and proceed to the login screen.
  alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

  # Sniff network info.
  alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

  function cded() {
    cd $1
    $EDITOR .
  }
fi

# Count code lines in some directory.
# $ loc py js css
# # => Lines of code for .py: 3781
# # => Lines of code for .js: 3354
# # => Lines of code for .css: 2970
# # => Total lines of code: 10105
function loc() {
  local total
  local firstletter
  local ext
  local lines
  total=0
  for ext in $@; do
    firstletter=$(echo $ext | cut -c1-1)
    if [[ firstletter != "." ]]; then
      ext=".$ext"
    fi
    lines=`find-exec "*$ext" cat | wc -l`
    lines=${lines// /}
    total=$(($total + $lines))
    echo "Lines of code for ${fg[blue]}$ext${reset_color}: ${fg[green]}$lines${reset_color}"
  done
  echo "${fg[blue]}Total${reset_color} lines of code: ${fg[green]}$total${reset_color}"
}

# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM.
function ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}

# Shortcut for searching commands history.
function hist() {
  history 0 | grep $@
}

# Execute commands for each file in current directory.
function each() {
  for dir in *; do
    echo "${dir}:"
    cd $dir
    $@
    cd ..
  done
}

# Shortens GitHub URLs.
# By Sorin Ionescu <sorin.ionescu@gmail.com>
function gitio() {
  local url="$1"
  local code="$2"

  [[ -z "$url" ]] && print "usage: $0 url code" >&2 && exit
  [[ -z "$code" ]] && print "usage: $0 url code" >&2 && exit

  curl -s -i 'http://git.io' -F "url=$url" -F "code=$code"
}

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# docker
eval `boot2docker shellinit 2>/dev/null`