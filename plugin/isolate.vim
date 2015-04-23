if (exists('g:loaded_isolate') && g:loaded_isolate) || v:version < 700 || &cp
    finish
endif
let g:loaded_isolate = 1

command! -nargs=0 -range Isolation <line1>,<line2>call isolate#Isolation()
