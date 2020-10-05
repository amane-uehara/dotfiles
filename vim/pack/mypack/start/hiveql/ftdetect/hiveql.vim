if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

autocmd BufNewFile,BufRead *.hql set filetype=hiveql expandtab
autocmd BufNewFile,BufRead *.q   set filetype=hiveql expandtab
