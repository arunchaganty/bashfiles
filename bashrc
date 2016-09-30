export TERM=xterm-256color
source /etc/profile
set -o vi

function is_osx() {
  [[ `uname` == "Darwin" ]];
}

# Import linux coreutils because the mac ones are really funny.
if `is_osx`; then
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi;
source $HOME/.shells/functions

# Check for an interactive session
[ -z "$PS1" ] && return

export PS1='\[\033[01;32m\][\u@\h\[\033[01;32m\] \W \[\033[01;33m\]$(parse_git_branch)\[\033[01;33m\]]\$ \[\033[00m\]'

source $HOME/.shells/alias
source $HOME/.shells/exports
source $HOME/.shells/welcome

if [ -e $HOME/.shells-local/setup ]; then
  source $HOME/.shells-local/setup 
fi
if [ -e $HOME/.shells-local/exports ]; then
  source $HOME/.shells-local/exports 
fi
if [ -e $HOME/.shells-local/alias ]; then
  source $HOME/.shells-local/alias 
fi
if [ -e $HOME/.shells-local/functions ]; then
  source $HOME/.shells-local/functions 
fi
