# Git aliases
alias g="git"
alias gb="git branch"
alias gs="git status"
alias gco="git checkout"
alias ga.="git add ."
alias gcan="git commit --amend --no-edit"
alias gcmg="git commit -m"
alias gpu="git pu"
alias gbprune="git remote update --prune"
alias gbpurge="git fetch --prune && git branch -vv | grep ':gone]' | awk '{print $1}' | xargs git branch -d"

# Screen
alias sls="screen -ls"

# Terminal Aliases
alias cls="clear"
alias jobs="jobs -l"
alias rm="rm -iv"

# vim
alias svim="sudo vim"

# Python
alias py2="python2"
alias py3="python"

# vim
alias vless='vim -u /usr/share/vim/vim74/macros/less.vim'

# ssh
alias bbone="ssh kettro@76.11.25.36"
