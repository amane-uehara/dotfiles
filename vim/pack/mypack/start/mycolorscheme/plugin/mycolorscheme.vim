let g:mycolorscheme_highlight_url =
      \ get(g:, 'mycolorscheme_highlight_url', 0)
let g:mycolorscheme_highlight_todo =
      \ get(g:, 'mycolorscheme_highlight_todo', 0)
let g:mycolorscheme_highlight_full_space =
      \ get(g:, 'mycolorscheme_highlight_full_space', 0)

augroup ZenkakuSpace
  autocmd!
  autocmd VimEnter,WinEnter * match ZenkakuSpace /\%u3000/ " %u3000 is the character code of Zenkaku space
augroup END

augroup SpaceEndLine
  autocmd!
  autocmd VimEnter,WinEnter * match SpaceEndLine /\s\+\n/
augroup END
