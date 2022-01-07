#!/bin/sh

HOME_PATH="$HOME"
DOTFILES_PATH="${HOME_PATH}/dotfiles"
BACKUP_PATH="${HOME_PATH}/.default_dotfiles"
LOCALENV_PATH="${DOTFILES_PATH}/localenv"

echo "creating backup directory" 1>&2

if [ -d ${BACKUP_PATH} ]; then
  echo "${BACKUP_PATH} aleady exists" 1>&2
else
  mkdir ${BACKUP_PATH}
fi

echo "symbolic link to ${HOME_PATH}" 1>&2

for FILENAME in \
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
  if [ -e ${HOME_PATH}/.${FILENAME} ]; then
    mv ${HOME_PATH}/.${FILENAME} ${BACKUP_PATH}
    echo "original ${HOME_PATH}/.${FILENAME} is moved to ${BACKUP_PATH}" 1>&2
  fi

  ln -s ${DOTFILES_PATH}/${FILENAME} ${HOME_PATH}/.${FILENAME}
done

echo "copying example files in ${LOCALENV_PATH}" 1>&2

for FILENAME in \
  vimrc \
  zshrc \
  plugin_loader.vim \
  tmux.conf \
  screenrc \
; do
  if [ -e ${LOCALENV_PATH}/${FILENAME} ]; then
    echo "${HOME_PATH}/.${FILENAME} aleady exists" 1>&2
  else
    cp ${LOCALENV_PATH}/${FILENAME}.example ${LOCALENV_PATH}/${FILENAME}
  fi
done


cd ${LOCALENV_PATH}
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
git clone git@github.com:amane-uehara/zsh-simple-snippet.git
