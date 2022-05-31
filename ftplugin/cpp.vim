let s:cb = {->
	 \ switchy#has_suffix(bufname(''), '.cpp')
         \ ? bufname('')[:-5] . '.h'
         \ : bufname('')[:-3] . '.cpp'}

call switchy#add('cpp', s:cb)
