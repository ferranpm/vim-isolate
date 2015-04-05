function! isolate#Isolate() range
    let ft = &filetype
    let lines = getline(a:firstline, a:lastline)
    new
    execute 'set ft='.ft
    let b:isolate = {
                \ 'firstline': a:firstline,
                \ 'lastline' : a:lastline,
                \ 'bufname'  : bufname("%")
                \ }
    call setline(1, lines)
endfunction

function! isolate#UnIsolate()
    if !exists('b:isolate') | return | endif
    let new_lines = getline(0, line('$'))
    let bufname = b:isolate['bufname']
    let firstline = b:isolate['firstline']
    let lastline = b:isolate['lastline']
    bwipeout!
    execute 'buffer'.bufnr(bufname)
    execute firstline.','.lastline.'delete'
    call append(firstline - 1, new_lines)
endfunction
