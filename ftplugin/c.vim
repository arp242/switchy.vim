let s:cb = {->
	 \ switchy#has_suffix(bufname(''), '.c')
         \ ? bufname('')[:-3] . '.h'
         \ : bufname('')[:-3] . '.c'}

call switchy#add('c', s:cb)
call switchy#add('cpp', s:cb)
