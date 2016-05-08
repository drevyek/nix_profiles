# /bin/bash 

# Script to copy these dot profiles into the home directory, and update them
if [ -z $1 ]; then
  echo "Copying dotfiles"
  find . -type f -name ".*" -print | xargs -i cp {} ~
elif [ $1 = "-g" ]; then
  echo "Getting dotfiles"
  find . -maxdepth 1 -type f -name ".*" -print | xargs -i cp ~/{} .
else
  echo "Unknown option: $1"
  echo "Usage: ./cpdot.sh [-g]"
  echo "Copies, or[-g]ets all coordesponding dotfiles between ~ and pwd"
fi

