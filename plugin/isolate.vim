if (exists('g:loaded_isolate') && g:loaded_isolate) || v:version < 700 || &cp
    finish
endif
let g:loaded_isolate = 1

command! -nargs=0 -range Isolate   '<,'>call isolate#Isolate()
command! -nargs=0        UnIsolate      call isolate#UnIsolate()
