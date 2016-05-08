# I use ~/usrbin for my own personal installs; includied in the path by the .bashrc
if [ ! -d ~/usrbin ]; then
  echo "making ~/usrbin"
  mkdir ~/usrbin 
fi

# To move all the dotprofiles to the ~ directory
chmod +x ./cpdot.sh 
./cpdot.sh

# My vim requires ack as a dependency; (uses ack.vim)
if [ ! -f ~/usrbin/ack ]; then
  echo "Installing ack"
  curl http://beyondgrep.com/ack-2.14-single-file > ~/usrbin/ack && chmod 0755 ~/usrbin/ack
fi

# To facilitate a fresh vim install

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo "Installing Vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

