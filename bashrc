
# Check for an interactive session
[ -z "$PS1" ] && return

PS1='[\u@\h \W]\$ '

source $HOME/.shells/exports
source $HOME/.shells/alias

