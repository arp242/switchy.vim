fun! s:Cb()
	let [base, ext] = [expand('%:t:r'), expand('%:t:e')]
	if ext ==# 'h'
		return base .. (buffer_exists(base .. '.cpp') || filereadable(base .. '.cpp') ? '.cpp' : '.c')
	endif
    return base .. '.h'
endfun
call switchy#add('cpp', funcref('s:Cb'))
