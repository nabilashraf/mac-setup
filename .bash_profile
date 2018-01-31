alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor; brew cask cleanup'
alias rmhis='rm .bash_history; history -c; logout'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

RED='\[\033[1;31m\]'
GREEN='\[\033[1;32m\]'
YELLOW='\[\033[1;33m\]'
PURPLE='\[\033[1;35m\]'
GRAY='\[\033[1;30m\]'
DEFAULT='\[\033[0m\]'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="${RED}\u ${GRAY}• ${GREEN}\h ${GRAY}• ${YELLOW}\w${GRAY}\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" •\")${PURPLE}\$(parse_git_branch)\n${GRAY}\$ ${DEFAULT}"
