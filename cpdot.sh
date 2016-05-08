# /bin/bash 

# Script to copy these dot profiles into the home directory, and update them
if [ -z $1 ]; then
  echo "copying dotfiles"
  find . -type f -name ".*" -print | xargs -i cp {} ~
else
  echo "getting dotfiles"
  find . -maxdepth 1 -type f -name ".*" -print | xargs -i cp ~/{} .
fi

