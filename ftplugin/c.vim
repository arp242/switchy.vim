let s:cb = {->
        \ switchy#has_suffix(bufname(''), '.h')
        \ ? filereadable(bufname('')[:-3] .. '.c' ) ?  bufname('')[:-3] .. '.c' :  bufname('')[:-3] .. '.cpp'
        \ : switchy#has_suffix(bufname(''), '.c') ? bufname('')[:-3] .. '.h' : bufname('')[:-5] .. '.h'
        \ }


call switchy#add('c', s:cb)
