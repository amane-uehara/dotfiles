#!/bin/sh

HOME_PATH="$HOME"
DOTFILES_PATH="${HOME_PATH}/dotfiles"
BACKUP_PATH="${HOME_PATH}/.default_dotfiles"

if [ -d ${BACKUP_PATH} ]; then
  :
else
  mkdir ${BACKUP_PATH}
fi

for i in \
  bash_logout \
  bash_profile \
  bash_temporary_dir \
  bashrc \
  localenv \
  screenrc \
  tmux.conf \
  vim \
  vim_temporary_dir \
  vimrc \
  zsh \
  zsh_temporary_dir \
  zshrc \
; do
  if [ -f ${HOME_PATH}/.$i ]; then
    mv ${HOME_PATH}/.$i ${BACKUP_PATH}
  fi

  if [ -d ${HOME_PATH}/.$i ]; then
    mv ${HOME_PATH}/.$i ${BACKUP_PATH}
  fi

  ln -s ${DOTFILES_PATH}/$i ${HOME_PATH}/.$i
done
