let s:cb = {->
        \ switchy#has_suffix(bufname(''), '.h')
        \ ? filereadable(bufname('')[:-3] .. '.cpp' ) ?  bufname('')[:-3] .. '.cpp' :  bufname('')[:-3] .. '.c'
        \ : switchy#has_suffix(bufname(''), '.cpp') ? bufname('')[:-5] .. '.h' : bufname('')[:-3] .. '.h'
        \ }

call switchy#add('cpp', s:cb)
