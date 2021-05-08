function! isolate#Isolation() range
    if exists('b:isolate')
        call isolate#UnIsolate()
    else
        execute a:firstline . ',' . a:lastline . 'call isolate#Isolate()'
    endif
endfunction

function! isolate#Isolate() range
    let ft            = &filetype
    let lines         = getline(a:firstline, a:lastline)
    let bufnr         = bufnr(bufname("%"))
    let wasmodifiable = &modifiable
    new
    set modifiable
    execute 'set ft='.ft
    let b:isolate = {
                \ 'firstline'     : a:firstline,
                \ 'lastline'      : a:lastline,
                \ 'bufnr'         : bufnr,
                \ 'wasmodifiable' : wasmodifiable,
                \ }
    call setline(1, lines)
    if !b:isolate['wasmodifiable']
        echoerr 'Warning source buffer not modifiable!'
    endif
endfunction

function! isolate#UnIsolate()
    if !exists('b:isolate') | return | endif
    let new_lines   = getline(0, line('$'))
    let bufnr       = b:isolate['bufnr']
    let isolatedbuf = bufnr("%")
    let firstline   = b:isolate['firstline']
    let lastline    = b:isolate['lastline']
    execute 'buffer!'.bufnr
    if &modifiable
        execute firstline.','.lastline.'delete'
        call append(firstline - 1, new_lines)
        exe 'bwipeout!' . isolatedbuf
        try
            close
        catch
        endtry
        if bufwinnr(bufnr)
            exe bufwinnr(bufnr) . 'wincmd w'
        endif
    else
        exe 'buffer' . isolatedbuf
        echoerr 'Can''t merge with a non modifiable buffer!'
        " TODO: ? prompt to have the script set modifiable?
    endif
endfunction
