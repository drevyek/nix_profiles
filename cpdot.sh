# /bin/bash 

# Script to copy these dot profiles into the home directory, and update them
if [ -z $1 ]; then
  echo "Copying dotfiles"
  find . -type f -name ".*" -print | xargs -i cp {} ~
  if [ ! -d ~/.vifm ]; then
    mkdir ~/.vifmrc
    cp -r /usr/share/vifm/ ~/.vifm/
  fi
  cp vifmrc ~/.vifm/
elif [ $1 = "-g" ]; then
  echo "Getting dotfiles"
  find . -maxdepth 1 -type f -name ".*" -print | xargs -i cp ~/{} .
  cp ~/.vifm/vifmrc .
else
  echo "Unknown option: $1"
  echo "Usage: ./cpdot.sh [-g]"
  echo "Copies, or[-g]ets all coordesponding dotfiles between ~ and pwd"
fi

