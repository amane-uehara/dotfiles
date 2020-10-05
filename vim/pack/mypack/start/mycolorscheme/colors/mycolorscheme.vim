set background=dark
highlight clear

set t_Co=256
let colors_name = "mycolorscheme"
if exists("syntax_on")
  syntax reset
endif

highlight Normal         cterm=none                                gui=none    guifg=#dddddd guibg=#000000
highlight Comment        cterm=none      ctermfg=243               gui=none    guifg=#767676
highlight Constant       cterm=none      ctermfg=111               gui=none    guifg=#87afff
highlight String         cterm=none      ctermfg=215               gui=none    guifg=#ffaf5f
highlight Character      cterm=none      ctermfg=214               gui=none    guifg=#ffaf00
highlight Number         cterm=none      ctermfg=81                gui=none    guifg=#5fdfff
highlight Boolean        cterm=none      ctermfg=227               gui=none    guifg=#ffff5f
highlight Float          cterm=none      ctermfg=85                gui=none    guifg=#5fffaf
highlight Identifier     cterm=none      ctermfg=117               gui=none    guifg=#87dfff
highlight Function       cterm=none      ctermfg=123               gui=none    guifg=#5fffff
highlight Statement      cterm=none      ctermfg=76                gui=none    guifg=#5fdf00
highlight Conditional    cterm=none      ctermfg=166               gui=none    guifg=#ef7f00
highlight Operator       cterm=none      ctermfg=220               gui=none    guifg=#ffdf00

highlight default link Repeat    Statement
highlight default link Label     Statement
highlight default link Keyword   Statement
highlight default link Exception Statement

highlight PreProc        cterm=none      ctermfg=39                gui=none    guifg=#00afff
highlight Include        cterm=none      ctermfg=38                gui=none    guifg=#00afdf
highlight Define         cterm=none      ctermfg=37                gui=none    guifg=#00afaf
highlight Macro          cterm=none      ctermfg=36                gui=none    guifg=#00af87
highlight PreCondit      cterm=none      ctermfg=35                gui=none    guifg=#00af5f
highlight Type           cterm=none      ctermfg=207               gui=none    guifg=#ff9fff
highlight StorageClass   cterm=none      ctermfg=201               gui=none    guifg=#ff7fff
highlight Structure      cterm=none      ctermfg=200               gui=none    guifg=#ff7fdf
highlight Typedef        cterm=none      ctermfg=199               gui=none    guifg=#ff7faf
highlight Special        cterm=none      ctermfg=178               gui=none    guifg=orange
highlight SpecialChar    cterm=none      ctermfg=208               gui=none    guifg=orange
highlight Tag            cterm=none      ctermfg=180               gui=none    guifg=orange
highlight Delimiter      cterm=none      ctermfg=181               gui=none    guifg=orange
highlight SpecialComment cterm=none      ctermfg=182               gui=none    guifg=violet
highlight Debug          cterm=none      ctermfg=183               gui=none    guifg=violet
highlight TabLine        cterm=none      ctermfg=253  ctermbg=241  gui=none    guifg=#dadada guibg=#606060
highlight TabLineFill    cterm=none      ctermfg=253  ctermbg=241  gui=none    guifg=#dadada guibg=#606060
highlight TabLineSel     cterm=bold      ctermfg=253               gui=bold    guifg=#dadada
highlight Visual         cterm=none      ctermbg=241               gui=none                  guibg=#606060

highlight default link VisualNOS Visual
highlight default link URL Underlined

highlight Underlined     cterm=underline ctermfg=45                gui=underline guifg=#00dfff
highlight Error          cterm=none      ctermfg=15   ctermbg=124  gui=none    guifg=#ffffff guibg=#af0000
highlight WarningMsg     cterm=none      ctermfg=7    ctermbg=0    gui=none    guifg=#c0c0c0 guibg=#000000
highlight Todo           cterm=reverse   ctermfg=185  ctermbg=16   gui=reverse guifg=#dfdf5f guibg=#000000
highlight DiffAdd        cterm=none                   ctermbg=22   gui=none                  guibg=#005f00
highlight DiffChange     cterm=none                   ctermbg=52   gui=none                  guibg=#5f0000
highlight DiffDelete     cterm=none                   ctermbg=88   gui=none                  guibg=#870000
highlight DiffText       cterm=none                   ctermbg=160  gui=none                  guibg=#df0000
highlight DiffFile       cterm=none      ctermfg=47                gui=none    guifg=#00ff5f
highlight DiffNewFile    cterm=none      ctermfg=199               gui=none    guifg=#ff00af

highlight default link DiffRemoved DiffDelete

highlight DiffLine       cterm=none      ctermfg=129               gui=none    guifg=#af00ff

highlight default link DiffAdded DiffAdd
highlight default link ErrorMsg Error
highlight default link FullSpace Error

highlight Ignore         cterm=none                                gui=none
highlight VertSplit      cterm=none      ctermfg=0    ctermbg=242  gui=none    guifg=#000000 guibg=#666666
highlight Folded         cterm=none      ctermfg=247  ctermbg=235  gui=none    guifg=#aaaaaa guibg=#262626
highlight FoldColumn     cterm=none      ctermfg=247  ctermbg=235  gui=none    guifg=#aaaaaa guibg=#262626
highlight SignColumn     cterm=none      ctermfg=247  ctermbg=235  gui=none    guifg=#9e9e9e guibg=#262626
highlight SpecialKey     cterm=none      ctermfg=242               gui=none    guifg=#666666
highlight NonText        cterm=none      ctermfg=0                 gui=none    guifg=#000000
highlight StatusLineNC   cterm=none      ctermfg=0    ctermbg=242  gui=none    guifg=#000000 guibg=#666666

if version >= 700
 highlight CursorLine    cterm=none                   ctermbg=235  gui=none                  guibg=#262626
 highlight ColorColumn   cterm=none                   ctermbg=239  gui=none                  guibg=#4e4e4e
 highlight CursorColumn  cterm=none                   ctermbg=235  gui=none                  guibg=#262626
 highlight LineNr        cterm=none      ctermfg=220  ctermbg=235  gui=none    guifg=#ffdf00 guibg=#262626
 highlight CursorLineNr  cterm=bold      ctermfg=160  ctermbg=195  gui=bold    guifg=#d70000 guibg=#d7ffff
 highlight MatchParen    cterm=none                   ctermbg=240  gui=none                  guibg=#585858
 highlight Pmenu         cterm=none      ctermfg=0    ctermbg=gray gui=none    guifg=#000000 guibg=gray
 highlight PmenuSel      cterm=none      ctermfg=0    ctermbg=242  gui=none    guifg=#000000 guibg=#666666
 highlight PmenuSbar     cterm=none      ctermfg=15   ctermbg=242  gui=none    guifg=#ffffff guibg=#666666
 highlight PmenuThumb    cterm=none      ctermfg=15   ctermbg=242  gui=none    guifg=#ffffff guibg=#666666
endif

highlight SpellBad       cterm=none                   ctermbg=52   gui=none                  guibg=#5f0000
highlight Search         cterm=reverse   ctermfg=220  ctermbg=234  gui=reverse guifg=#ffdf00 guibg=#1c1c1c
highlight IncSearch      cterm=reverse   ctermfg=136  ctermbg=236  gui=reverse guifg=#af8700 guibg=#303030

function! s:newmatch()"{{{
  if g:mycolorscheme_highlight_url ||
   \ g:mycolorscheme_highlight_todo ||
   \ g:mycolorscheme_highlight_full_space
    if exists("b:mycolorscheme_match")
      for m in getmatches()
        if m.group == 'URL' ||
         \ m.group == 'Todo' ||
         \ m.group == 'FullSpace'
          call matchdelete(m.id)
        endif
      endfor
    endif
    if g:mycolorscheme_highlight_url
      call matchadd('URL',
            \'\(https\?\|ftp\|git\):\/\/\('
            \.'[&:#*@~%_\-=?/.0-9A-Za-z]*'
            \.'\(([&:#*@~%_\-=?/.0-9A-Za-z]*)\)\?'
            \.'\({\([&:#*@~%_\-=?/.0-9A-Za-z]*\|{[&:#*@~%_\-=?/.0-9A-Za-z]*}\)}\)\?'
            \.'\(\[[&:#*@~%_\-=?/.0-9A-Za-z]*\]\)\?'
            \.'\)*[/0-9A-Za-z]*\(:\d\d*\/\?\)\?', -1)
    endif
    if g:mycolorscheme_highlight_todo
      call matchadd('Todo', '\<\([tT]odo\|TODO\)\>', -1)
    endif
    if g:mycolorscheme_highlight_full_space
      call matchadd('FullSpace', '　', -1)
    endif
    let b:mycolorscheme_match = 1
  endif
endfunction
augroup MatchAdd
  autocmd!
  autocmd BufCreate,BufNew,WinEnter * call s:newmatch()
augroup END
"}}}

highlight default link SpellCap SpellBad
highlight default link SpellLocal SpellBad
highlight default link SpellRare SpellBad
highlight default link vimCmplxRepeat Normal

highlight ZenkakuSpace   cterm=none      ctermfg=0    ctermbg=124  gui=none    guifg=#000000 guibg=Red
highlight SpaceEndLine   cterm=none      ctermfg=0    ctermbg=124  gui=none    guifg=#000000 guibg=Red
