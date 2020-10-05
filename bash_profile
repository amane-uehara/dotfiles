# This file will be read even when the connection is from scp / ssh.
if [ -f $HOME/.localenv/bash_profile ] ;then
  source $HOME/.localenv/bash_profile
fi
