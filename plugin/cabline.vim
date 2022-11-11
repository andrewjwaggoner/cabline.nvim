" prevent plugin from being loaded more than once
if exists("g:loaded_cabline")
    finish
endif
let g:loaded_cabline = 1
