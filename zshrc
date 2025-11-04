# history# {{{
HISTFILE=~/.zsh_temporary_dir/zsh_history
HISTSIZE=500000
SAVEHIST=500000
setopt hist_ignore_dups # ignore duplication of history
setopt share_history    # share command history with other (different process) zsh
# }}}
# keybind {{{
bindkey -v

# sj is <ESC># {{{
bs-esc-or-insert() {
  if [[ "${LBUFFER}" =~ "s$" ]]; then
    LBUFFER=${LBUFFER%s}
    zle vi-cmd-mode
  else
    zle self-insert
  fi
}
zle -N bs-esc-or-insert
bindkey "j" bs-esc-or-insert
#}}}

# unset ^l and ^k
bindkey -r -M vicmd '^l'
bindkey -r "^l"
bindkey -r -M vicmd '^k'
bindkey -r "^k"

# show command history at insert-mode
bindkey "^p" up-line-or-history
bindkey "^n" down-line-or-history

# beginning search
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# cursor move by hjkl at completion mode
zstyle ':completion:*:default' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# delete
bindkey '^h' backward-delete-char
bindkey "^?" backward-delete-char # Back space
bindkey "^w" backward-kill-word

# delete first character by ^u, BS, and ^w
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char
# }}}
# others# {{{
setopt no_beep                     # unset beep sound
setopt brace_ccl                   # {a-c} becomes a b c
setopt extended_glob               # ~ becomes ```except'''
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # delimiter. / is not included, thus ^w delete the directory or filename
# }}}
# source local file# {{{
if [ -f $HOME/.localenv/zshrc ] ;then
  source $HOME/.localenv/zshrc
fi
# }}}
# cd hook# {{{
setopt auto_cd    # change directory without typing ```cd''' command
setopt auto_pushd # cd - [tab] --> directory history is shown
# cd fook function
function chpwd(){
  # ls when directory is changed
  # when too much files exist, only first and last 5 file names are shown.
  if [ 150 -le $(\ls |wc -l ) ] ;then
    \ls -lhF |head -n 6
    echo '...'
    \ls -lhF |tail -n 5
    echo "$(\ls |wc -l ) files exist"
  else
    ls
  fi
}
# }}}
