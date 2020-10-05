# This file will be read even when the connection is from scp / ssh.
export HISTFILE=$HOME/.bash_temporary_dir/.bash_history
if [ -f $HOME/.localenv/bashrc ] ;then
  source $HOME/.localenv/bashrc
fi
