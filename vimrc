"  .    . -+- +    + +---+  +--+
"  |    |  |  |\  /| |   / |    \
"   \  /   |  | \/ | |---\ |
" *  \/   -+- |    | |    \ \___/
"
" source plugin loader"{{{
if filereadable(expand($HOME.'/.localenv/plugin_loader.vim'))
  if (v:version >= 800)
    set packpath+=$HOME/.localenv/vim
    source $HOME/.localenv/plugin_loader.vim
  endif
endif
"}}}
" backup, swap, viminfo, history, netrwhist"{{{
set backupdir=$HOME/.vim_temporary_dir/default/backupdir
set directory=$HOME/.vim_temporary_dir/default/swap
set viminfo='20,<50,s10,h,n$HOME/.vim_temporary_dir/default/viminfo
set history=300
let g:netrw_home = $HOME.'/.vim_temporary_dir/default/netrwhist'
"}}}
" Misc configure"{{{
filetype plugin on             " load filetype depending plugins
filetype indent on             " change indent types depending on filetype
set vb t_vb=                   " unset sound bell and visual bell
set ambiwidth=double           " adjust Non-ASCII charactor width
set nrformats=alpha            " decimal number increment and alphabetical increment by C-a,C-x
set modeline                   " read mode line on the top/bottom of the file, like ```# vim: expandtab fenc=cp932 ff=unix ft=rest'''
set foldmethod=marker          " folding at {{{ and }}}
let loaded_matchparen=1        " do not highlight corresponding bracket ('''set noshowmatch''' does not work)
set hlsearch                   " search with highlight

" Show status line
set showcmd                    " When type 3dd, 3d will be shown in the bottom right.
set statusline=%F%m%r%h%w\ \|\ \[%Y]\[%{&fileencoding},%{&ff}]\[%04l,%04v][%p%%]\[%l/%L]
set laststatus=2               " status line is shown in the second line from the buttom.
set cmdheight=1                " status line is always shown.

" Number and relativenumber
if (v:version >= 800 || (v:version >= 703 && has('patch1115')))
  set relativenumber
  set number
  nnoremap [MyLeader]n :<C-u>set relativenumber!<CR>:<C-u>set number!<CR>
elseif (v:version >= 703)
  set relativenumber
  nnoremap [MyLeader]n :<C-u>set relativenumber!<CR>
else
  set number
  nnoremap [MyLeader]n :<C-u>set number!<CR>
endif

" New-line, tab, indent, syntax
set expandtab                  " Space is used instead of tab
set tabstop=2                  " two space is used instead of one tab
set autoindent                 " indent is automatically inserted at new-line
set shiftwidth=2               " two space is used as indent
set backspace=indent,eol,start " Delete new-line at insert mode
set wrap                       " long line (excess line) is shown like new-line

" Emphasis tab character and Zenkaku space
set lcs=tab:>-,trail:-
set lcs=tab:>-,eol:<,nbsp:%
set lcs=extends:>,precedes:<
set list

syntax on " syntax must be set after the definition of the ZenkakuSpace in autogroup
"}}}
" Keymap"{{{
inoremap sj <ESC>
vnoremap sj <ESC>

" Use Space key as [MyLeader]
xnoremap [MyLeader] <Nop>
xmap     <Space>    [MyLeader]
nnoremap [MyLeader] <Nop>
nmap     <Space>    [MyLeader]

" command-line mode
nnoremap :            q:<ESC>a
nnoremap q:           :
nnoremap !!           q:<ESC>a.!
vnoremap :            q:<ESC>a
vnoremap q:           :
vnoremap !            q:<ESC>a!
autocmd CmdwinEnter * inoremap <buffer> <ESC> <ESC>

" Close special buffer by qq
autocmd FileType help nnoremap <expr><buffer> qq          <C-w>c
autocmd CmdwinEnter * nnoremap <buffer>       qq          :q<CR>

" Put the searched line in the middle of the window
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap [MyLeader]r :<C-u>noh<CR><C-l>

" Folding
nnoremap [MyLeader]e zo
nnoremap [MyLeader]f zc
nnoremap [MyLeader]g zMzv
vnoremap [MyLeader]m zf

" insert mode
inoremap <C-h> <BS>

" window move
nnoremap [MyLeader]l :<C-u>tabnext<CR>
nnoremap [MyLeader]h :<C-u>tabprevious<CR>
nnoremap [MyLeader]j :<C-u>cnext<CR>
nnoremap [MyLeader]k :<C-u>cprevious<CR>
nnoremap [MyLeader]q :<C-u>q<CR>

" visual star
vnoremap * y<ESC>/\V<C-R>"<CR>
"}}}
" Filetype Specific"{{{
" Binary editor (xxd) mode settings (vim -b or open *.bin files)
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  " autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePre * if &binary | execute "%!xxd -r" | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

" Indents
augroup fileTypeIndent
  autocmd!
  autocmd FileType c  setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType py setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" Snippets
augroup fileTypeKeymap
  autocmd FileType c inoremap <buffer> <C-j> <ESC>f@cf@
  autocmd FileType c inoremap <buffer> ; ;
  autocmd FileType c inoremap <buffer> ;d fprintf(stderr, "@CURSOR@\n"@CURSOR@);0f@cf@
  autocmd FileType c inoremap <buffer> ;e else if (@CURSOR@) {}0kf@cf@
  autocmd FileType c inoremap <buffer> ;f for (int @CURSOR@=0; @CURSOR@<@CURSOR@; @CURSOR@++) {}0kf@cf@
  autocmd FileType c inoremap <buffer> ;i if (@CURSOR@) {}0kf@cf@
  autocmd FileType c inoremap <buffer> ;m #include <stdio.h>#include <assert.h>int main(int argc, const char **argv) {if (argc != @CURSOR@) {fprintf(stderr, "Invalid argc (%d)\n", argc);return 1;}}04kf@cf@
  autocmd FileType c inoremap <buffer> ;o FILE *fp;char *filename = "@CURSOR@";if ((fp = fopen(filename, "w")) == NULL) {fprintf(stderr, "Failed to open %s.\n", filename);}fclose(fp);04kf@cf@
  autocmd FileType c inoremap <buffer> ;p fprintf(@CURSOR@, "@CURSOR@\n"@CURSOR@);0f@cf@
  autocmd FileType c inoremap <buffer> ;t typedef struct {int @CURSOR@;} HOGE;0kf@cf@
  autocmd FileType c inoremap <buffer> ;w while (@CURSOR@) {}0kf@cf@
augroup END

"}}}
" encoding "{{{
set fileencodings=utf-8,ucs-bom,euc-jp,eucjp-ms,cp932 " trial order of the encodings when opening new file
set encoding=utf-8                                    " encoding used inside vim itself

if has('win32')
  set termencoding=cp932                              " encoding used in the terminal.
else
  set termencoding=utf-8
endif

set fileformats=unix,dos,mac                          " trial order of the file format when open new file
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=egrep\ -nH
"}}}
" OS depending configure"{{{
" show the correct color at cmd.exe
if has('win32') && !has('gui_running') && !empty($CONEMUBUILD)
  set term=xterm
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif
"}}}
" Load device-depending configuration file"{{{
if filereadable(expand($HOME.'/.localenv/vimrc'))
  source $HOME/.localenv/vimrc
endif
"}}}
