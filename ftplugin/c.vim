fun! s:Cb()
	let [base, ext] = [expand('%:t:r'), expand('%:t:e')]
	if ext ==# 'h'
        return base .. (filereadable(base .. '.c') ? '.c' : '.cpp')
	endif
    return base .. '.h'
endfun
call switchy#add('c', funcref('s:Cb'))
