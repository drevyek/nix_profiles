# /bin/bash 

# Script to copy these dot profiles into the home directory, and update them


find . -type f -name ".*" -print | xargs -i cp {} ~
