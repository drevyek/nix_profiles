# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# bash_history
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

#Terminal/Prompt Options
set bell-style visible
set completion-ignore-case on
shopt -s checkwinsize
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        color_prompt=yes
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
        color_prompt=
    fi
fi
unset color_prompt force_color_prompt
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Set Colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

TERM=gnome-256color

# ls Aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# External Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.usrbinrc ]; then
  . ~/.usrbinrc
fi

# Tab Completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# PATH Modifications
PATH=~/bin:$PATH
exToPath(){
  case ":${PATH}:" in
    *:$1:*) ;;
    *)            PATH=${PATH}:$1;;
  esac
  export PATH
}
exToPath "$HOME/.rvm/bin"
exToPath "$HOME/usrbin"

# Processes
psgrep(){
  if [! -z $1]; then 
    echo "Grepping for Processes matching $1"
    ps aux | grep $1 | grep -v grep
  else
    echo "!! Need name to grep!"
  fi
}

# x and go
cpg(){
  if [ -d "$2" ]; then
    cp $1 $2 && cd $2
  else 
    cp $1 $2
  fi
}

mvg(){
  if [ -d "$2" ]; then
    mv $1 $2 && cd $2
  else 
    mv $1 $2
  fi
}

mkdg(){
  if [ -d "$1" ]; then
    mkdir $1 && cd $1
  fi
}


# File Extraction/Compression
extract(){
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)  tar xjf $1    ;;
      *.tar.gz)   tar xzf $1    ;;
      *.bz2)      bunzip2 $1    ;;
      *.rar)      rar x $1      ;;
      *.gz)       gunzip $1     ;;
      *.tar)      tar xf $1     ;;
      *.tbz2)     tar xjf $1    ;;
      *.tgz)      tar xzf $1    ;;
      *.zip)      unzip $1      ;;
      *.Z)        uncompress $1 ;;
      *.7z)       7z x $1       ;;
      *)          echo "Unknown file extension"   ;;
    esac
  else
    echo "$1 is not a valid file"
  fi
}

# Misc Options

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=$VISUAL
